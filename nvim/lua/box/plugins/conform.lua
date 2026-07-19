return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'ruff_format', 'ruff_organize_imports' },
          c = { 'clang-format' },
          cpp = { 'clang-format' },
          java = { 'clang-format' },
        },
      })
    end
  }
}
