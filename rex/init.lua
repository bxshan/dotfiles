-- Rex key bindings, migrated from tmux (~/.config/tmux/tmux.conf) and iTerm2.
-- The tmux prefix ` starts every tmux-derived sequence.

-- tmux
rex.bind("`>`", "pane.send_key", { key = "`" })
rex.bind("`>r", "client.config.reload")
rex.bind("`>shift+\\", "pane.split", { direction = "right" })
rex.bind("`>-", "pane.split", { direction = "down" })
rex.bind("`>h", "pane.focus", { direction = "left" })
rex.bind("`>l", "pane.focus", { direction = "right" })
rex.bind("`>k", "pane.focus", { direction = "up" })
rex.bind("`>j", "pane.focus", { direction = "down" })

-- iTerm2 GlobalKeyMap 0xd-0x20000-0x24: shift+enter sends a newline (LF, ctrl+j)
rex.bind("shift+enter", "pane.send_key", { key = "ctrl+j" })
