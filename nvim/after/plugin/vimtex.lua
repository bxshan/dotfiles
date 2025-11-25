-- Enable filetype plugins + indent and syntax (safe even if your plugin manager does it)
vim.cmd([[
  filetype plugin indent on
  syntax enable
]])

-- Preferred viewer (pick ONE of these two styles):
vim.g.vimtex_view_method = "zathura"     -- comment this out if you use Okular below

-- Generic viewer example (Okular). If you prefer Okular, set method to 'general' and keep these.
-- vim.g.vimtex_view_method = "general"
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"  -- note the double backslash

-- Compiler backend (default is latexmk). If latexmk is missing, use one of the fallbacks below.
-- vim.g.vimtex_compiler_method = "latexmk"
-- vim.g.vimtex_compiler_method = "latexrun"   -- requires latexrun on PATH
-- vim.g.vimtex_compiler_method = "tectonic"   -- requires tectonic on PATH

-- Local leader for VimTeX mappings (optional)
vim.g.maplocalleader = "\\"

