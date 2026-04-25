require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'clangd', 'jdtls', 'pylsp', 'lua_ls'},
})
