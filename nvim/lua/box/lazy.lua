local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'nvim-telescope/telescope.nvim', version = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' } },
  { "ellisonleao/gruvbox.nvim" },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { "windwp/nvim-autopairs", event = "InsertEnter" },
  'lukas-reineke/indent-blankline.nvim',
  'eandrju/cellular-automaton.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { "sitiom/nvim-numbertoggle" },
  'prichrd/netrw.nvim',
  {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
  },
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  'tzachar/highlight-undo.nvim',
  'numToStr/Comment.nvim',
  {
    'alanfortlink/blackjack.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
  },
  {
    'vyfor/cord.nvim',
    build = './build || .\build',
  },
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
  },
  "danymat/neogen",
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "NStefan002/screenkey.nvim", version = "*" },

  -- LSP & CMP
  {'onsails/lspkind.nvim'},
  {'hrsh7th/nvim-cmp'},
  {"hrsh7th/cmp-cmdline"},
  {"saadparwaiz1/cmp_luasnip"},
  {"rafamadriz/friendly-snippets"},
  {'hrsh7th/cmp-nvim-lsp'},
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", 
    build = "make install_jsregexp"
  },
  
  {'backdround/global-note.nvim'},

  "folke/which-key.nvim",
  
  {"RRethy/vim-illuminate"},

  'nvim-tree/nvim-web-devicons',

  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  {
    'madskjeldgaard/cppman.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    config = function()
      local cppman = require"cppman"
      cppman.setup()
      vim.keymap.set("n", "<leader>cm", function()
        cppman.open_cppman_for(vim.fn.expand("<cword>"))
      end)
      vim.keymap.set("n", "<leader>cpp", function()
        cppman.input()
      end)
    end
  },

  {
    'greggh/claude-code.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('claude-code').setup({
        window = { position = 'vertical botright', split_ratio = 0.4 },
        git = { use_git_root = false, multi_instance = false },
        shell = { separator = ';', pushd_cmd = 'cd', popd_cmd = 'true' },
        keymaps = { toggle = { variants = { verbose = '<leader>cc' } } }
      })
    end
  },

  "lervag/vimtex",
  'mcauley-penney/visual-whitespace.nvim',

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  'tomiis4/Hypersonic.nvim',
  'benknoble/vim-mips',

  {
    "mvllow/modes.nvim",
    version = "v0.2.1",
    config = function()
      require("modes").setup({
        colors = {
          copy = "#f9e2af",   -- richer pastel yellow
          delete = "#f38ba8", -- richer pastel red
          insert = "#a6e3a1", -- richer pastel green
          visual = "#cba6f7", -- richer pastel purple
        },
        line_opacity = 0.3,
        set_cursor = true,
        set_cursorline = true,
        set_number = true,
        set_signcolumn = true,
        ignore = { "NvimTree", "TelescopePrompt", "!minifiles" }
      })
    end
  }
})
