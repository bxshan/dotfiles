local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  --lsp_zero.default_keymaps({buffer = bufnr})
  --preserve_mappings = false
  lsp_zero.default_keymaps({
    buffer = bufnr,
    exclude = {'K', 'gd', 'gi', 'gr', '<F2>', '<F3>'},
    preserve_mappings = false
  })
  vim.keymap.set({'n', 'x'}, 'ff', function()
    vim.lsp.buf.format({async = false, timeout_ms = 10000})
  end, opts)
  preserve_mappings = false
end) 
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
}
)

lsp_zero.set_sign_icons({
  --error = '✘',
  error = ' !',
  --warn = '▲',
  warn = '',
  hint = '⚑',
  info = '»'
})

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['jdtls'] = {'java'},
    ['pylsp'] = {'python'},
    ['clangd'] = {'c++'},
  }
})

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"jdtls", "pylsp"},
  handlers = {
    function(server_name)
      require('lspconfig')['jdtls'].setup({})
      require('lspconfig')['pylsp'].setup({})
      require('lspconfig')['clangd'].setup({})
    end,
  },
})

-- disable virtual text
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false;
        underline = false;
    }
)

-- Function to toggle autocomplete for nvim-cmp
function _G.toggle_autocomplete()
    if vim.g.autocomplete_enabled == nil then
        vim.g.autocomplete_enabled = true
    end

    local cmp = require('cmp')

    if vim.g.autocomplete_enabled then
        cmp.setup.buffer { enabled = true }  -- Enable autocomplete
        print("Autocomplete enabled")
    else
        cmp.setup.buffer { enabled = false } -- Disable autocomplete
        print("Autocomplete disabled")
    end

    vim.g.autocomplete_enabled = not vim.g.autocomplete_enabled
end

-- Keybinding to toggle autocomplete
vim.api.nvim_set_keymap('n', '<Leader>aa', '<Cmd>lua toggle_autocomplete()<CR>', { noremap = true, silent = true })

