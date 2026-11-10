vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true                -- case-insensitive search...
vim.opt.smartcase = true                 -- ...unless the query has a capital
vim.opt.inccommand = "split"             -- live preview of :substitute

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.showmode = false

vim.opt.splitright = true                -- vertical splits open to the right
vim.opt.splitbelow = true                -- horizontal splits open below

vim.o.winborder = "rounded"              -- rounded border on all floating windows

-- folds --
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 3

-- default colorscheme
vim.cmd.colorscheme('gruvbox')

-- Inside a herdr pane (or plain SSH) the pane may still see box-pc's own
-- DISPLAY/WAYLAND_DISPLAY, so nvim would copy to box-pc's clipboard instead
-- of the machine you are typing on. OSC 52 sends the yank through the
-- terminal, and herdr forwards it to the client that last sent input.
if vim.env.HERDR_PANE_ID or vim.env.SSH_TTY then
  vim.g.clipboard = "osc52"
end
