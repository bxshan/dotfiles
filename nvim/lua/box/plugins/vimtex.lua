return {
  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1       -- forward search on compile
      vim.g.vimtex_view_skim_activate = 1   -- focus Skim after forward search

      -- Preferred viewer (pick ONE of these two styles):
      vim.g.vimtex_view_method = "zathura_simple"     -- zathura_simple: no xdotool (X11-only); works on Wayland

      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
        },
      }

      vim.g.maplocalleader = "\\"

      -- Suppress noisy longtable warning in the quickfix list
      vim.g.vimtex_quickfix_ignore_filters = {
        "Infinite glue shrinkage found in box being split",
      }, -- Kept your filter, adopted comma from incoming

    end, -- Adopted comma from incoming
  }, -- Adopted structure from incoming
}