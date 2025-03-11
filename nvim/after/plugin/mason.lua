require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'clangd', 'jdtls', 'pylsp'},
  handlers = {
    function(clangd)
      require('lspconfig')['clangd'].setup({})
    end,
    function(jdtls)
      require('lspconfig')['jdtls'].setup({})
    end,
    function(pylsp)
      require('lspconfig')['pylsp'].setup({})
    end,
  },
})
