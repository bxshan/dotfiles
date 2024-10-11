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

  -- UNDOTREE UNDO HISTORY --
  use 'mbbill/undotree'

  -- LSP-ZERO LSP --
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

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

  -- USAGE TRACKER USAGE TRACKER --
  use 'gaborvecsei/usage-tracker.nvim'

  -- NVIM-NUMBERTOGGLE TOGGLES RELATIVE AND ABSOLUTE LINE NUMBERS --
  use { "sitiom/nvim-numbertoggle" }

  -- CINNAMON SMOOTH SCROLLING --
  use {
    "declancm/cinnamon.nvim",
    config = function() require("cinnamon").setup() end
  }
  
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

end)
