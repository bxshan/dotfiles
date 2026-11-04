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

-- tmux default prefix bindings that have Rex counterparts
rex.bind("`>c", "client.tab.new")
rex.bind("`>n", "session.next")
rex.bind("`>p", "session.previous")
for i = 1, 9 do
  rex.bind("`>" .. i, "client.tab.goto", { index = i })
end
rex.bind("`>,", "client.tab.rename")
rex.bind("`>shift+7", "client.tab.close")            -- &
rex.bind("`>x", "pane.close")
rex.bind("`>z", "pane.zoom")
rex.bind("`>o", "pane.focus_next")
rex.bind("`>shift+1", "pane.move_to_new_tab")        -- !
rex.bind("`>s", "session.switch")
rex.bind("`>shift+9", "client.tab.previous")         -- (
rex.bind("`>shift+0", "client.tab.next")             -- )
rex.bind("`>shift+4", "session.rename")              -- $
rex.bind("`>shift+;", "client.palette.toggle")       -- :

-- iTerm2 GlobalKeyMap 0xd-0x20000-0x24: shift+enter sends a newline (LF, ctrl+j)
rex.bind("shift+enter", "pane.send_key", { key = "ctrl+j" })
