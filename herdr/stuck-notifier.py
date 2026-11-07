#!/usr/bin/env python3
"""Notify when a herdr agent is stuck waiting for you.

herdr marks an agent "blocked" when it stops to ask something (a permission
prompt, a question). herdr already shows one alert when that happens; this
script adds two things on top:

  1. the alert names the agent and shows the question it is stuck on, and
  2. it reminds you again every REMIND_EVERY seconds while the agent stays
     blocked, so one missed alert doesn't leave an agent waiting for hours.

How it works: every POLL seconds it runs `herdr agent list`, compares each
agent's status with the previous poll, and sends `herdr notification show`
when an agent has just become blocked or a reminder is due. When an agent
leaves "blocked" (you answered it), its reminder clock is forgotten.

Usage:
  stuck-notifier.py            run forever
  stuck-notifier.py --dry-run  print what it would send instead of notifying
  stuck-notifier.py --self-test  check the decision logic on made-up data
"""

import json
import os
import re
import shutil
import subprocess
import sys
import time

POLL = 5                 # seconds between checks
REMIND_EVERY = 10 * 60   # seconds between reminders for a still-blocked agent
SCREEN_LINES = 6         # how many lines of the agent's screen to include

# Use the herdr on PATH, else the usual install location.
HERDR = shutil.which("herdr") or os.path.expanduser("~/.local/bin/herdr")


def herdr(*args):
    """Run a herdr command and return its stdout, or None if it failed
    (for example while the herdr server isn't running)."""
    try:
        out = subprocess.run([HERDR, *args], capture_output=True, text=True, timeout=15)
    except (OSError, subprocess.TimeoutExpired):
        return None
    return out.stdout if out.returncode == 0 else None


def list_agents():
    """Return herdr's agent list, or None if herdr can't be reached."""
    out = herdr("agent", "list")
    if out is None:
        return None
    try:
        return json.loads(out)["result"]["agents"]
    except (ValueError, KeyError):
        return None


BORDER = set("─│┌┐└┘├┤┬┴┼╭╮╯╰═║╌ ❯>")


def summarize_prompt(screen):
    """Pull the question out of a blocked agent's screen text.

    A Claude Code permission prompt is drawn below the last horizontal rule
    (a line of ─). Inside it: the tool ("Bash command"), a one-line
    description, the command in a │-bordered box, then the question
    ("Do you want to proceed?") and numbered options. We keep the tool,
    the description, the first command line and the question, and drop the
    options and key hints. Without a rule line, fall back to the last few
    meaningful lines."""
    lines = [l.strip() for l in screen.splitlines()]
    lines = [l for l in lines if l]
    rules = [i for i, l in enumerate(lines) if len(l) >= 10 and set(l) <= {"─"}]
    if not rules:
        rest = [l for l in lines if not set(l) <= BORDER]
        return "\n".join(rest[-SCREEN_LINES:])[:400]
    block = lines[rules[-1] + 1:]
    command = next((l.lstrip("│ ").strip() for l in block if l.startswith("│")), "")
    plain = [l for l in block
             if not set(l) <= BORDER
             and not l.startswith("│")
             and not l.startswith("Esc to cancel")
             and not re.match(r"^(❯\s*)?\d+\.\s", l)]
    question = next((l for l in reversed(plain) if l.endswith("?")), "")
    parts = plain[:2]
    if command:
        parts.append("$ " + (command[:100] + "…" if len(command) > 100 else command))
    if question and question not in parts:
        parts.append(question)
    return "\n".join(parts)[:400]


def question_text(pane_id):
    """What the blocked agent is asking, from its visible screen."""
    screen = herdr("agent", "read", pane_id, "--source", "visible", "--lines", "40") or ""
    return summarize_prompt(screen)


def name_of(agent):
    """A short human name for an agent: its terminal title, else its pane."""
    return agent.get("terminal_title_stripped") or agent.get("pane_id", "agent")


def decide(agents, blocked_since, last_alert, now):
    """Work out which alerts to send this poll.

    blocked_since: pane_id -> time it was first seen blocked (updated in place)
    last_alert:    pane_id -> time we last alerted about it (updated in place)
    Returns a list of (agent, is_reminder) pairs to notify about.
    """
    to_send = []
    blocked_now = set()
    for agent in agents:
        pane = agent.get("pane_id")
        if agent.get("agent_status") != "blocked" or not pane:
            continue
        blocked_now.add(pane)
        if pane not in blocked_since:
            # Newly blocked: alert straight away.
            blocked_since[pane] = now
            last_alert[pane] = now
            to_send.append((agent, False))
        elif now - last_alert[pane] >= REMIND_EVERY:
            # Still blocked and a reminder is due.
            last_alert[pane] = now
            to_send.append((agent, True))
    # Forget agents that are no longer blocked, so a later block alerts again.
    for pane in list(blocked_since):
        if pane not in blocked_now:
            del blocked_since[pane]
            last_alert.pop(pane, None)
    return to_send


def notify(agent, is_reminder, since, now, dry_run):
    minutes = int((now - since) // 60)
    if is_reminder:
        title = f"Still waiting ({minutes} min): {name_of(agent)}"
    else:
        title = f"Agent needs you: {name_of(agent)}"
    body = question_text(agent["pane_id"]) or "(no question text on screen)"
    body += f"\n\npane {agent['pane_id']} · {agent.get('cwd', '')}"
    if dry_run:
        print(f"--- would notify ---\n{title}\n{body}\n", flush=True)
        return
    herdr("notification", "show", title, "--body", body, "--sound", "request")


def self_test():
    """Check decide() on made-up data, without touching herdr."""
    global REMIND_EVERY
    REMIND_EVERY = 600
    since, last = {}, {}
    a = {"pane_id": "w1:p1", "agent_status": "blocked"}
    idle = {"pane_id": "w1:p1", "agent_status": "idle"}
    assert decide([a], since, last, 0) == [(a, False)], "new block alerts"
    assert decide([a], since, last, 300) == [], "no repeat before reminder time"
    assert decide([a], since, last, 600) == [(a, True)], "reminder after 10 min"
    assert decide([a], since, last, 900) == [], "next reminder waits again"
    assert decide([idle], since, last, 950) == [] and not since, "answered: forgotten"
    assert decide([a], since, last, 1000) == [(a, False)], "blocks again: fresh alert"
    assert decide([{"agent_status": "blocked"}], {}, {}, 0) == [], "no pane id: ignored"
    screen = "\n".join([
        "● Committing", "─" * 40, " Bash command", " Commit the prep locally",
        "╌" * 40, " │ cd ~/src/x && git commit -m wip", " │ second line",
        " Do you want to proceed?", " ❯ 1. Yes", "   2. No", " Esc to cancel · Tab to amend"])
    assert summarize_prompt(screen) == (
        "Bash command\nCommit the prep locally\n$ cd ~/src/x && git commit -m wip\n"
        "Do you want to proceed?"), summarize_prompt(screen)
    print("self-test passed")


def main():
    if "--self-test" in sys.argv:
        self_test()
        return
    dry_run = "--dry-run" in sys.argv
    blocked_since, last_alert = {}, {}
    while True:
        agents = list_agents()
        if agents is not None:
            now = time.time()
            for agent, is_reminder in decide(agents, blocked_since, last_alert, now):
                notify(agent, is_reminder, blocked_since[agent["pane_id"]], now, dry_run)
        time.sleep(POLL)


if __name__ == "__main__":
    main()
