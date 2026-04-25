return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')
      local vscodesnippets = require("luasnip.loaders.from_vscode")
      vscodesnippets.lazy_load()

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      -- gruvbox gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#928374' })
      -- gruvbox bright blue
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#83a598' })
      -- gruvbox bright aqua
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#8ec07c' })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
      -- gruvbox bright purple
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#d3869b' })
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
      -- gruvbox fg1
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#ebdbb2' })
      vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
      vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

      -- max num of elements to suggest
      vim.opt.pumheight = 7;

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
          },
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
          end,
        },
        enabled = function()
          -- disable completion in comments
          local context = require 'cmp.config.context'
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == 'c' then
            return true
          else
            return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
          end
        end,
        -- https://www.reddit.com/r/neovim/comments/1gs66xy/prioritizing_snippets_over_lsp_or_others/
        sources = cmp.config.sources({
          { name = "luasnip" },
        }, {
          {
            name = "nvim_lsp",
          },
        }),
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                  if luasnip.expandable() then
                      luasnip.expand()
                  else
                      cmp.confirm({
                          select = true,
                      })
                  end
              else
                  fallback()
              end
          end),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        view = {
          -- name can be "custom", "wildmenu" or "native"
          entries = {name = 'custom', selection_order = 'near_cursor' }
        }
      })

    end
  }
}
