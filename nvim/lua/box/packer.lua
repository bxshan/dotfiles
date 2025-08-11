-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- PACKER --
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- TELESCOPE -- 
  -- fzf (open with <leader>ff)
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- GRUVBOX --
  -- best colorscheme
  use { "ellisonleao/gruvbox.nvim" }

  -- TREESITTER --
  -- syntax highlighting
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- AUTOPAIRS --
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end
  } 

  -- INDENT-BLANKLINE --
  -- display vertical bars to show indented lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- CELLULAR-AUTOMATON --
  -- haha code moves funny
  use 'eandrju/cellular-automaton.nvim' 

  -- BARBECUE --
  -- winbar (top bar)
  -- use({
  --   "utilyre/barbecue.nvim",
  --   tag = "*",
  --   requires = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons", -- optional dependency
  --   },
  --   -- after = "nvim-web-devicons", -- keep this if you're using NvChad
  --   config = function()
  --     require("barbecue").setup() 
  --   end,
  -- })

  -- LUALINE --
  -- statusline (bottom bar)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- CODEWINDOW --
  -- minimap
  use {
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup()
    codewindow.apply_default_keybinds()
  end,
  }

  -- NVIM-NUMBERTOGGLE --
  -- toggles relative and absolute line numbers in insert and command mode 
  use { "sitiom/nvim-numbertoggle" }

  -- NETRW --
  -- custom netrw layout
  use 'prichrd/netrw.nvim'

  -- ALPHA-VIM --
  -- startup screen
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

  -- VIM FUGITIVE --
  -- git plugin
  use 'tpope/vim-fugitive'

  -- GITSIGNS --
  -- git signs for git diffs
  use 'lewis6991/gitsigns.nvim'

  -- GITHUB COPILOT --
  -- use 'github/copilot.vim'
  -- TODO

  -- HIGHLIGHT UNDO --
  -- shows what undo and redo changed
  use 'tzachar/highlight-undo.nvim' 

  -- COMMENT.NVIM --
  -- commenting plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- BLACKJACK --
  -- gamba yay
  use {
    'alanfortlink/blackjack.nvim',
    requires = {'nvim-lua/plenary.nvim'},
  }

  -- CORD --
  -- discord integration
  use {
    'vyfor/cord.nvim',
    run = './build || .\\build',
    config = function()
      require('cord').setup()
    end,
  }
  
  -- COMPETITEST -- 
  -- competitive programming practice
  use {
    'xeluxee/competitest.nvim',
    requires = 'MunifTanjim/nui.nvim',
    config = function() require('competitest').setup() end
  }

  -- NEOGEN --
  -- annotation generator (<leader>dd for javadocs)
  use {
    "danymat/neogen",
    config = function()
      require('neogen').setup {}
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  }

  -- MASON --
  -- lsp manager
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- SCREENKEY (SHOWKEYS) --
  -- display keystrokes --
  -- use({'nvzone/showkeys'}) -- not using bc it messes up autocmds
  -- using this instead:
  use({ "NStefan002/screenkey.nvim", tag = "*" })

  -- LSP & CMP --
  -- and it only took ~10 hours to set up snippets --
  -- not touching this bc it will probably break --
  ---------------------------------------------------
  -- idk what this is for -
  use({'onsails/lspkind.nvim'})
  use{
    'hrsh7th/nvim-cmp',
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  }
  use({'hrsh7th/cmp-nvim-lsp'})
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })

  -- ORIGAMI & UFO --
  -- better folds (za zc zo replacement)
  -- really annoying sometimes
  --use {
  --  "chrisgrieser/nvim-origami",
  --  config = function() require("origami").setup({}) end, -- setup call needed
  --}
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- GLOBAL NOTE --
  use({'backdround/global-note.nvim'})

  -- WHICH KEY --
  use {
    "folke/which-key.nvim",
    config = function()
      -- Optional keybinding for buffer local keymaps
      vim.keymap.set("n", "<leader>?", function()
        require("which-key").show({ global = false })
      end, { desc = "Buffer Local Keymaps (which-key)" })
    end
  }

  -- ILLUMINATE -- 
  -- highlight other instances of word under cursor
  use({"RRethy/vim-illuminate"})

  -- BARBAR --
  -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  -- use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
  -- use({'romgrk/barbar.nvim'})
  
  -- BUFFERLINE --
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  -- cppman
  use {
    'madskjeldgaard/cppman.nvim',
    requires = {
      { 'MunifTanjim/nui.nvim' }
    },
    config = function()
      local cppman = require"cppman"
      cppman.setup()

      -- Make a keymap to open the word under cursor in CPPman
      vim.keymap.set("n", "<leader>cm", function()
        cppman.open_cppman_for(vim.fn.expand("<cword>"))
      end)

      -- Open search box
      vim.keymap.set("n", "<leader>cpp", function()
        cppman.input()
      end)

    end
  }

  -- claude-code
  use {
    'greggh/claude-code.nvim',
    requires = {
      'nvim-lua/plenary.nvim', -- Required for git operations
    },
    config = function()
      require('claude-code').setup({
        window = {
          position = 'vertical botright',
          split_ratio = 0.4,
        },
        git = {
          use_git_root = false,
          multi_instance = false,
        },
        shell = {
          separator = ';',
          pushd_cmd = 'cd',
          popd_cmd = 'true',
        },
        keymaps = {
          toggle = {
            variants = {
              verbose = '<leader>cc',
            },
          },
        }
      })
    end
  }

end)
