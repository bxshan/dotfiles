
return {
  {
    "mvllow/modes.nvim",
    version = "v0.2.1",
    config = function()
      require("modes").setup({
        colors = {
          copy = "#f9e2af",   -- richer pastel yellow
          delete = "#f38ba8", -- richer pastel red
          insert = "#a6e3a1", -- richer pastel green
          visual = "#cba6f7", -- richer pastel purple
        },
        line_opacity = 0.3,
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
        set_signcolumn = true,
        ignore = { "NvimTree", "TelescopePrompt", "!minifiles" }
      })
    end
  }
}
