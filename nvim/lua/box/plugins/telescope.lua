return {
  {
    'nvim-telescope/telescope.nvim', 
    version = '0.1.8', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      require('telescope').setup{ 
        defaults = { 
          file_ignore_patterns = {
            "%.ctxt$",
            "%.class$",
            "%.bluej$",
            "%.out$",
            "%.vscode/",
          }
        }
      }

    end
  }
}
