return {
  {
    "lervag/vimtex",
    ft = { "tex", "bib" },
    init = function()
      if vim.fn.has("mac") == 1 then
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1       -- forward search on compile
        vim.g.vimtex_view_skim_activate = 1   -- focus Skim after forward search
      else
        vim.g.vimtex_view_method = "zathura_simple"   -- zathura_simple: no xdotool (X11-only); works on Wayland
      end

      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
        },
      }

      vim.g.maplocalleader = "\\"

      -- Suppress noisy warnings in the quickfix list
      -- (Underfull = cosmetic loose lines; Overfull still shows — those are real margin violations)
      vim.g.vimtex_quickfix_ignore_filters = {
        "Infinite glue shrinkage found in box being split",
        "Underfull",
      }

    end,
  },
}