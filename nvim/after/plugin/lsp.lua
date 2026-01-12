-- Reserve a space in the gutter to avoid layout shift
vim.opt.signcolumn = 'yes'

-- Setup global default capabilities
local default_capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities()
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

-- Language server setups using new vim.lsp.config API

vim.lsp.config.jdtls = {
  cmd = { 'jdtls' },
  filetypes = { 'java' },
  root_markers = { '.git', 'pom.xml', 'build.gradle' },
  capabilities = default_capabilities,
}

vim.lsp.config.pylsp = {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = { '.git', 'pyproject.toml', 'setup.py' },
  capabilities = default_capabilities,
}

vim.lsp.config.clangd = {
  cmd = { "clangd", "--compile-commands-dir=." },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { '.git', 'compile_commands.json' },
  capabilities = vim.tbl_deep_extend(
    'force',
    default_capabilities,
    { offsetEncoding = 'utf-8' }  -- match Copilot
  ),
}

-- Enable the language servers
vim.lsp.enable('jdtls')
vim.lsp.enable('pylsp')
vim.lsp.enable('clangd')
