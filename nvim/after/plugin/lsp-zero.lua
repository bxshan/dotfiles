--[[
  ARCHIVED LSP CONFIGURATION - KEPT FOR REFERENCE
  This section contains the old/alternative LSP setup that was replaced
  by the cleaner configuration below. Kept for backup/reference purposes.
--]]

---- Reserve a space in the gutter
---- This will avoid an annoying layout shift in the screen
--vim.opt.signcolumn = 'yes'
--
---- Add cmp_nvim_lsp capabilities settings to lspconfig
---- This should be executed before you configure any language server
----local lspconfig_defaults = require('lspconfig').util.default_config
----lspconfig_defaults.capabilities = vim.tbl_deep_extend(
----'force',
----lspconfig_defaults.capabilities,
----require('cmp_nvim_lsp').default_capabilities()
----)
--
---- old
--local lspconfig_defaults = require('lspconfig').util.default_config
--
--lspconfig_defaults.capabilities = vim.tbl_deep_extend(
--  'force',
--  lspconfig_defaults.capabilities,
--  require('cmp_nvim_lsp').default_capabilities(),
--  {
--    -- Force a specific offset encoding
--    offsetEncoding = 'utf-8', -- or 'utf-16' if needed by specific servers
--  }
--)
--
---- This is where you enable features that only work
---- if there is a language server active in the file
--vim.api.nvim_create_autocmd('LspAttach', {
--  desc = 'LSP actions',
--  callback = function(event)
--    local id = vim.tbl_get(event, 'data', 'client_id')
--    local client = id and vim.lsp.get_client_by_id(id)
--    if client == nil then
--      return
--    end
--
--    --client.server_capabilities.semanticTokensProvider = nil
--    
--    vim.keymap.set({'n', 'x'}, 'gq', function()
--      vim.lsp.buf.format({async = false, timeout_ms = 10000})
--    end, opts)
--
--    local opts = {buffer = event.buf}
--
--    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
--    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
--    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
--    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
--    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
--    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
--    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
--    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
--    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
--    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
--  end,
--})
--
----require('lspconfig').clangd.setup {
----  --cmd = { "--std=c++11" },
----  --cmd = { "clangd", "--compile-commands-dir=.", "--std=c++11" },
----  --capabilities = {
----  --  offsetEncoding = { "utf-16" }
----  --}
----}
--
--require('lspconfig').jdtls.setup({})
--require('lspconfig').pylsp.setup({})
--require('lspconfig').clangd.setup({})
--
--
--
--[[
  ACTIVE LSP CONFIGURATION
  This is the current working LSP setup with proper keybindings and server configurations.
--]]

-- Reserve a space in the gutter to avoid layout shift
vim.opt.signcolumn = 'yes'

-- Setup global default capabilities
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities(),
  {
    --offsetEncoding = { 'utf-8' }
  }
)


-- Reusable on_attach function for LSP keybindings
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set({'n', 'x'}, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
  vim.keymap.set({'n', 'x'}, '<F3>', function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
end

-- Attach keymaps only when LSP is active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local id = vim.tbl_get(event, 'data', 'client_id')
    local client = id and vim.lsp.get_client_by_id(id)
    if client == nil then return end

    on_attach(client, event.buf)
  end,
})

-- Language server setups

require('lspconfig').jdtls.setup({
  on_attach = on_attach,
})

require('lspconfig').pylsp.setup({
  on_attach = on_attach,
})

require('lspconfig').clangd.setup({
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend(
    'force',
    require('cmp_nvim_lsp').default_capabilities(),
    { offsetEncoding = { 'utf-8' } }  -- ✅ match Copilot
  ),
  cmd = { "clangd", "--compile-commands-dir=." }
})
