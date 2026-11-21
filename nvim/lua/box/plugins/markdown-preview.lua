
return {
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_port = "8652"

      -- Open the preview with xdg-open. Panes inside herdr inherit the herdr server's
      -- environment, which starts before Hyprland and has no WAYLAND_DISPLAY, so a plain
      -- xdg-open there fails silently. If it's missing, use the live Wayland socket.
      _G.box_mkdp_open = function(url)
        local env = {}
        if not vim.env.WAYLAND_DISPLAY then
          local runtime = vim.env.XDG_RUNTIME_DIR or ("/run/user/" .. vim.uv.getuid())
          for _, path in ipairs(vim.fn.glob(runtime .. "/wayland-*", false, true)) do
            if not path:match("%.lock$") then
              env.WAYLAND_DISPLAY = vim.fn.fnamemodify(path, ":t")
              break
            end
          end
        end
        vim.fn.jobstart({ "xdg-open", url }, { detach = true, env = env })
      end
      vim.cmd([[
        function! BoxMkdpOpen(url) abort
          call v:lua.box_mkdp_open(a:url)
        endfunction
      ]])
      vim.g.mkdp_browserfunc = "BoxMkdpOpen"
    end,
  }
}
