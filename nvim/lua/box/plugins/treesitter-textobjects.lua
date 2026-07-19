return {
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',   -- must match nvim-treesitter (also on main); the branches are incompatible
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true,   -- jump forward to the textobject if not already on one
          selection_modes = {
            ['@parameter.outer'] = 'v',   -- charwise for arguments
            ['@function.outer'] = 'V',    -- linewise for functions
            ['@class.outer'] = 'V',       -- linewise for classes
          },
          include_surrounding_whitespace = false,
        },
        move = {
          set_jumps = true,   -- record moves in the jumplist (<C-o>/<C-i>)
        },
      })

      local select = require('nvim-treesitter-textobjects.select')
      local move = require('nvim-treesitter-textobjects.move')
      local swap = require('nvim-treesitter-textobjects.swap')

      -- Select: a = around (whole), i = inner (body). Works in visual + operator-pending.
      local objects = {
        ['af'] = '@function.outer',  ['if'] = '@function.inner',
        ['ac'] = '@class.outer',     ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
      }
      for lhs, obj in pairs(objects) do
        vim.keymap.set({ 'x', 'o' }, lhs, function()
          select.select_textobject(obj, 'textobjects')
        end, { desc = 'TS textobject ' .. obj })
      end

      -- Move between functions / arguments (also works in visual + operator-pending)
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Prev function start' })
      vim.keymap.set({ 'n', 'x', 'o' }, ']a', function() move.goto_next_start('@parameter.inner', 'textobjects') end, { desc = 'Next argument' })
      vim.keymap.set({ 'n', 'x', 'o' }, '[a', function() move.goto_previous_start('@parameter.inner', 'textobjects') end, { desc = 'Prev argument' })

      -- Swap the argument under the cursor with the next / previous one
      vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner') end, { desc = 'Swap arg with next' })
      vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner') end, { desc = 'Swap arg with prev' })
    end
  }
}
