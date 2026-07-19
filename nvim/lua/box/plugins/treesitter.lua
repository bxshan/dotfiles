
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup()

      -- Ensure parsers for the languages we actually edit (idempotent: skips
      -- already-installed ones, so no recompile on startup)
      require('nvim-treesitter').install({
        'c', 'cpp', 'java', 'python', 'lua', 'xml',
        'latex', 'bibtex', 'markdown', 'markdown_inline', 'bash', 'json',
      })

      -- Attach treesitter parser to each buffer so highlighting and foldexpr work
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(ev)
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end
  }
}
