-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/box/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?.lua;/Users/box/.cache/nvim/packer_hererocks/2.1.1744318430/share/lua/5.1/?/init.lua;/Users/box/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?.lua;/Users/box/.cache/nvim/packer_hererocks/2.1.1744318430/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/box/.cache/nvim/packer_hererocks/2.1.1744318430/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["blackjack.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/blackjack.nvim",
    url = "https://github.com/alanfortlink/blackjack.nvim"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
  },
  ["claude-code.nvim"] = {
    config = { "\27LJ\2\nä\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\r\0005\4\v\0005\5\n\0=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fkeymaps\vtoggle\1\0\1\vtoggle\0\rvariants\1\0\1\rvariants\0\1\0\1\fverbose\15<leader>cc\nshell\1\0\3\14pushd_cmd\acd\rpopd_cmd\ttrue\14separator\6;\bgit\1\0\2\17use_git_root\1\19multi_instance\1\vwindow\1\0\4\bgit\0\vwindow\0\fkeymaps\0\nshell\0\1\0\2\rposition\22vertical botright\16split_ratio\4š³æÌ\t™³æþ\3\nsetup\16claude-code\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/claude-code.nvim",
    url = "https://github.com/greggh/claude-code.nvim"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codewindow.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\27apply_default_keybinds\nsetup\15codewindow\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/codewindow.nvim",
    url = "https://github.com/gorbit99/codewindow.nvim"
  },
  ["competitest.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/competitest.nvim",
    url = "https://github.com/xeluxee/competitest.nvim"
  },
  ["cord.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tcord\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cord.nvim",
    url = "https://github.com/vyfor/cord.nvim"
  },
  ["cppman.nvim"] = {
    config = { "\27LJ\2\nS\0\0\5\1\5\0\t-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\1K\0\1\0\0À\f<cword>\vexpand\afn\bvim\20open_cppman_for\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\ninputš\1\1\0\6\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0003\5\b\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\t\0003\5\n\0B\1\4\0012\0\0€K\0\1\0\0\16<leader>cpp\0\15<leader>cm\6n\bset\vkeymap\bvim\nsetup\vcppman\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cppman.nvim",
    url = "https://github.com/madskjeldgaard/cppman.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["global-note.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/global-note.nvim",
    url = "https://github.com/backdround/global-note.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["highlight-undo.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/highlight-undo.nvim",
    url = "https://github.com/tzachar/highlight-undo.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["molten-nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/molten-nvim",
    url = "https://github.com/benlubas/molten-nvim"
  },
  neogen = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["netrw.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/netrw.nvim",
    url = "https://github.com/prichrd/netrw.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/box/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-numbertoggle"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-numbertoggle",
    url = "https://github.com/sitiom/nvim-numbertoggle"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["screenkey.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/screenkey.nvim",
    url = "https://github.com/NStefan002/screenkey.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  vimtex = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["visual-whitespace.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/visual-whitespace.nvim",
    url = "https://github.com/mcauley-penney/visual-whitespace.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vglobal\1\tshow\14which-key\frequirep\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc%Buffer Local Keymaps (which-key)\0\14<leader>?\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: competitest.nvim
time([[Config for competitest.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0", "config", "competitest.nvim")
time([[Config for competitest.nvim]], false)
-- Config for: cppman.nvim
time([[Config for cppman.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\5\1\5\0\t-\0\0\0009\0\0\0006\2\1\0009\2\2\0029\2\3\2'\4\4\0B\2\2\0A\0\0\1K\0\1\0\0À\f<cword>\vexpand\afn\bvim\20open_cppman_for\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\ninputš\1\1\0\6\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\a\0003\5\b\0B\1\4\0016\1\3\0009\1\4\0019\1\5\1'\3\6\0'\4\t\0003\5\n\0B\1\4\0012\0\0€K\0\1\0\0\16<leader>cpp\0\15<leader>cm\6n\bset\vkeymap\bvim\nsetup\vcppman\frequire\0", "config", "cppman.nvim")
time([[Config for cppman.nvim]], false)
-- Config for: cord.nvim
time([[Config for cord.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tcord\frequire\0", "config", "cord.nvim")
time([[Config for cord.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: codewindow.nvim
time([[Config for codewindow.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\27apply_default_keybinds\nsetup\15codewindow\frequire\0", "config", "codewindow.nvim")
time([[Config for codewindow.nvim]], false)
-- Config for: claude-code.nvim
time([[Config for claude-code.nvim]], true)
try_loadstring("\27LJ\2\nä\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\r\0005\4\v\0005\5\n\0=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fkeymaps\vtoggle\1\0\1\vtoggle\0\rvariants\1\0\1\rvariants\0\1\0\1\fverbose\15<leader>cc\nshell\1\0\3\14pushd_cmd\acd\rpopd_cmd\ttrue\14separator\6;\bgit\1\0\2\17use_git_root\1\19multi_instance\1\vwindow\1\0\4\bgit\0\vwindow\0\fkeymaps\0\nshell\0\1\0\2\rposition\22vertical botright\16split_ratio\4š³æÌ\t™³æþ\3\nsetup\16claude-code\frequire\0", "config", "claude-code.nvim")
time([[Config for claude-code.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vglobal\1\tshow\14which-key\frequirep\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc%Buffer Local Keymaps (which-key)\0\14<leader>?\6n\bset\vkeymap\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
