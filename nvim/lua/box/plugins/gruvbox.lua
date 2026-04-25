return {
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      -- Default options:
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })

      vim.o.background = 'dark' -- or 'light' for light mode
      vim.cmd([[colorscheme gruvbox]])

      -- Manual overrides for extra transparency (covers things like floating windows, sidebars, etc.)
      local function make_transparent()
        local groups = {
          "Normal", "NormalFloat", "NormalNC", "SignColumn", "EndOfBuffer",
          "MsgArea", "Pmenu", "TelescopeNormal", "TelescopeBorder",
          "TelescopePromptBorder", "Folded", "NonText"
        }
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
      end

      make_transparent()

      -- Ensure transparency persists when the colorscheme is reloaded
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = make_transparent,
      })
    end
  }
}
