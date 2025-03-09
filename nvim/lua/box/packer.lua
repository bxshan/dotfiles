-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- PACKER PACKAGE MANAGER --
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TELESCOPE FZF -- 
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- GRUVBOX COLORSCHEME --
  use { "ellisonleao/gruvbox.nvim" }

  -- TREESITTER SYNTAX HIGHLIGHTING --
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- LUASNIP --
  use({
    --require("luasnip.loaders.from_snipmate").lazy_load({paths = "./snippets"}),
    "L3MON4D3/LuaSnip",
    config = function()
      require('box.snippets')
      
      local ls = require('luasnip')

      local M = {}

      function M.expand_or_jump()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end

      function M.jump_next()
        if ls.jumpable(1) then
          ls.jump(1)
        end
      end

      function M.jump_prev()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end

      function M.change_choice()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end

      function M.reload_package(package_name)
        for module_name, _ in pairs(package.loaded) do
          if string.find(module_name, '^' .. package_name) then
            package.loaded[module_name] = nil
            require(module_name)
          end
        end
      end

      function M.refresh_snippets()
        ls.cleanup()
        M.reload_package('box.snippets')
      end

      local set = vim.keymap.set

      local mode = { 'i', 's' }
      local normal = { 'n' }

      set(mode, '<C-R>', M.expand_or_jump)
      set(mode, '<c-n>', M.jump_prev)
      set(mode, '<c-l>', M.change_choice)
      set(normal, ',r', M.refresh_snippets)
    end,
    -- follow latest release.
    tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"


  })

  -- LSP-ZERO LSP --
  --use {
	--  'VonHeikemen/lsp-zero.nvim',
	--  branch = 'v3.x',
	--  requires = {
	--	  --- Uncomment the two plugins below if you want to manage the language servers from neovim
	--	  {'williamboman/mason.nvim'},
	--	  {'williamboman/mason-lspconfig.nvim'},

	--	  {'neovim/nvim-lspconfig'},
	--	  {'hrsh7th/nvim-cmp'},
	--	  {'hrsh7th/cmp-nvim-lsp'},
	--	  {'L3MON4D3/LuaSnip'},
	--  }
  --}

  -- AUTOPAIRS AUTOMATICALLY PAIR BRACKETS AND QUOTES --
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  } 

  -- INDENT-BLANKLINE INDENT DISPLAY --
  use 'lukas-reineke/indent-blankline.nvim'

  -- CELLULAR-AUTOMATON FUNNY ANIMATIONS FOR CODE --
  use 'eandrju/cellular-automaton.nvim' 

  -- BARBECUE WINBAR --
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  -- LUALINE STATUSLINE --
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- CODEWINDOW MINIMAP --
  use {
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup()
    codewindow.apply_default_keybinds()
  end,
  }

  -- NVIM-NUMBERTOGGLE TOGGLES RELATIVE AND ABSOLUTE LINE NUMBERS --
  use { "sitiom/nvim-numbertoggle" }

  -- NETRW CUSTOM NETRW LAYOUT --
  use 'prichrd/netrw.nvim'

  -- ALPHA-VIM STARTUP SCREEN --
  use {
    'goolord/alpha-nvim',
    requires = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  -- NOICE [UNUSED] -- 
  -- noice.lua missing --
  --[[
  use {
    'folke/noice.nvim',
    requires = { 
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    }
  }
  ]]--

  -- VIM FUGITIVE GIT PLUGIN --
  use 'tpope/vim-fugitive'

  -- GITSIGNS GIT SIGNS --
  use 'lewis6991/gitsigns.nvim'

  -- GITHUB COPILOT --
  use 'github/copilot.vim'

  -- HIGHLIGHT UNDO --
  use 'tzachar/highlight-undo.nvim' 

  -- COMMENT.NVIM COMMENTING PLUGIN --
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'alanfortlink/blackjack.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }

  -- CORD FOR DISCORD --
  use {
    'vyfor/cord.nvim',
    run = './build || .\\build',
    config = function()
      require('cord').setup()
    end,
  }
  
  use {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
    config = function() require('competitest').setup() end
  }

  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }

end)
