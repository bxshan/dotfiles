#!/usr/bin/env bash
# Ask before closing in herdr. config.toml runs this in a small popup:
#   prefix+x        confirm-close.sh        close the focused pane
#   prefix+shift+x  confirm-close.sh tab    close the focused tab (all its panes)
# herdr passes the focused pane, tab and space as HERDR_ACTIVE_* variables.
#
# The prompt names what will really go: closing a tab's only pane closes the
# tab, and closing a space's only tab closes the space too.

herdr="${HERDR_BIN_PATH:-herdr}"
mode="${1:-pane}"
pane="$HERDR_ACTIVE_PANE_ID"
tab="$HERDR_ACTIVE_TAB_ID"
space="$HERDR_ACTIVE_WORKSPACE_ID"

if [ -z "$pane" ] || [ -z "$tab" ]; then
    echo "herdr did not say what is focused; nothing closed."
    sleep 2
    exit 1
fi

tab_json=$("$herdr" tab get "$tab" 2>/dev/null)
panes=$(printf '%s' "$tab_json" | grep -o '"pane_count":[0-9]*' | cut -d: -f2)
label=$(printf '%s' "$tab_json" | sed -n 's/.*"label":"\([^"]*\)".*/\1/p')
tabs=$("$herdr" tab list --workspace "$space" 2>/dev/null | grep -o '"tab_id"' | wc -l | tr -d ' ')

if [ "$mode" = tab ]; then
    what="tab \"$label\""
    [ -n "$panes" ] && [ "$panes" != 1 ] && what="$what ($panes panes)"
    [ "$tabs" = 1 ] && what="$what and its space (last tab)"
elif [ "$panes" != 1 ]; then
    what="this pane"
elif [ "$tabs" = 1 ]; then
    what="tab \"$label\" and its space (last tab)"
else
    what="tab \"$label\""
fi

printf 'Close %s? [y/N] ' "$what"
read -rsn1 answer
echo
case "$answer" in
    y|Y)
        if [ "$mode" = tab ]; then
            ok() { "$herdr" tab close "$tab" >/dev/null 2>&1; }
        else
            ok() { "$herdr" pane close "$pane" >/dev/null 2>&1; }
        fi
        if ! ok; then
            echo "herdr refused to close it."
            sleep 2
        fi
        ;;
esac
