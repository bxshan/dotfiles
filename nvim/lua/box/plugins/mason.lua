return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'jdtls', 'pylsp', 'lua_ls' },
      })

      -- Ensure conform.nvim formatters are installed via Mason
      local registry = require('mason-registry')
      local ensure_tools = { 'stylua', 'clang-format', 'ruff' }
      local function all_present()
        for _, name in ipairs(ensure_tools) do
          local ok, pkg = pcall(registry.get_package, name)
          if not ok or not pkg:is_installed() then return false end
        end
        return true
      end
      -- Only hit the network registry when something is actually missing
      if not all_present() then
        registry.refresh(function()
          for _, name in ipairs(ensure_tools) do
            local pkg = registry.get_package(name)
            if not pkg:is_installed() then pkg:install() end
          end
        end)
      end
    end
  }
}
