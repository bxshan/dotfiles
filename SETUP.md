# Linux Setup — and how it mirrors the Mac

This box is **Ubuntu 26.04 / GNOME 50 on Wayland** (kernel 7.0), running the same
`~/dotfiles` repo as the Mac. The repo is the source of truth; `$HOME` holds
symlinks into it:

```
~/.zshrc        → ~/dotfiles/.zshrc
~/.tmux.conf    → ~/dotfiles/tmux/tmux.conf
~/.config/nvim  → ~/dotfiles/nvim
~/.config/ghostty/config → ~/dotfiles/ghostty/config
```

Editing a symlinked file edits the repo directly — commit from `~/dotfiles`.

## How the Mac setup is mirrored

Same repo on both machines → same configs. The only OS-specific code is two
branches in `.zshrc` (`if darwin / elif linux`) for `JAVA_HOME` + Homebrew paths.
Intentional divergences: **Ghostty** terminal on Linux (Alacritty on Mac), and
keyboard feel comes from **Toshy** here vs native macOS there.

## The four config layers

- **Terminal — Ghostty** (`ghostty/config`): Comic Mono (FiraCode Nerd Font fallback) 20pt, Gruvbox Dark.
- **Shell — zsh + oh-my-zsh** (`.zshrc`): theme `bureau`; `zoxide` aliased over
  `cd`; conda env `box` on PATH; aliases `vi`/`i`→nvim, `gcc`=`g++ -std=c++11 -O2`
  (+`gccsa`/`gccsu` sanitizers). Login shell was changed bash → `/usr/bin/zsh`.
- **tmux** (`tmux/tmux.conf`): **prefix is the backtick `` ` ``**; splits `` ` `` +`|`/`-`;
  vim-style `h/j/k/l` pane nav; `` ` ``+`r` reloads; Gruvbox top status bar with
  CPU/Bat scripts.
- **Neovim** (`nvim/`, `init.lua`→`require("box")`): lazy.nvim, Gruvbox, telescope,
  which-key, competitest; LSPs clangd/jdtls/lua_ls/pylsp. Must be the **0.12.3
  tarball** (not apt) + tree-sitter CLI.

## Desktop (GNOME) — mostly stock

- **Workspaces = macOS Spaces**: dynamic, switch with `Super+PageUp/PageDown`
  (also `Ctrl+Alt+←/→`); add `Shift` to carry the window. Overview (Mission
  Control) = `Super` or top-left hot corner.
- Maximize `Super+↑`, half-tile `Super+←/→` (tiling-assistant). Dock on the LEFT.
- **No custom GNOME keybindings** — the Mac-style shortcuts all come from Toshy.
- **Swipe-between-spaces has no equivalent**: this is a desktop with no touchpad.
  Use keys, or scroll the wheel over the Overview. Add any trackpad → gestures
  light up automatically.

## Toshy — the biggest change from stock Linux

`~/.config/toshy` runs **xwaykeyz** as a systemd user service that grabs the
keyboard (EVIOCGRAB) and rewrites every keystroke to **macOS conventions**
(Cmd+C/V/T/W/Tab/Space …). It autostarts. Config is essentially stock.

- Manage with **`toshy-services-{start,stop,restart,status}`** (NOT
  `toshy-config-*`).
- It maps physical **LeftCtrl → Meta**, which **breaks games** that need Ctrl.

### Gaming workflow (chosen default)

Toshy intercepts keys in-game. CS2's window class is bare `cs2`, which Toshy's
`steam_app_.*` exclusion regex does NOT match, so the per-app fix misses it.
Universal solution — toggle Toshy off while playing:

```sh
toshy-services-stop      # before launching the game
# ... play ...
toshy-services-start     # after quitting
```

Optional auto-toggle for CS2 only, via Steam launch options:
`bash -c "toshy-services-stop; %command%; toshy-services-start"`

## Gaming notes

- **Steam is the Snap package** (`~/snap/steam/...`). GPU: **RTX 5080** on NVIDIA
  open kernel module **595.71.05**.
- **CS2 launch fix:** launch options had a typo `mangohub %command%` → must be
  `mangohud %command%` (`mangohub` isn't a command, so the game exited instantly).
  Edit via Steam UI, not `localconfig.vdf` (Steam rewrites it on exit).
- Snap confinement may not see `/usr/bin/mangohud`; if it still won't launch,
  clear launch options to confirm CS2 runs, then fix MangoHud-in-Snap separately.
