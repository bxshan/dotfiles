return {
  {
    'nvim-telescope/telescope.nvim', 
    version = '0.1.8', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local function patch_treesitter_compat()
        local ok_parsers, ts_parsers = pcall(require, 'nvim-treesitter.parsers')
        if ok_parsers then
          ts_parsers.ft_to_lang = ts_parsers.ft_to_lang or function(ft)
            local get_lang = vim.treesitter.language and vim.treesitter.language.get_lang
            if type(get_lang) == 'function' then
              return get_lang(ft) or ft
            end
            return ft
          end

          ts_parsers.get_parser = ts_parsers.get_parser or function(bufnr, lang)
            return vim.treesitter.get_parser(bufnr, lang)
          end
        end

        local ok_configs = pcall(require, 'nvim-treesitter.configs')
        if not ok_configs then
          package.loaded['nvim-treesitter.configs'] = {
            is_enabled = function()
              return false
            end,
            get_module = function()
              return { additional_vim_regex_highlighting = false }
            end,
          }
        end
      end

      patch_treesitter_compat()

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
