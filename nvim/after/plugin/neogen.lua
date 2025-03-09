local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>dd", ":lua require('neogen').generate()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require('neogen').jump_prev<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>df", ":lua require('neogen').jump_next<CR>", opts)
