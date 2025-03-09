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
local package_path_str = "/Users/box/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?.lua;/Users/box/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?/init.lua;/Users/box/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?.lua;/Users/box/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/box/.cache/nvim/packer_hererocks/2.1.1716656478/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\nO\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3€-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\19expand_or_jump\23expand_or_jumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0À\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2ÿÿB\0\2\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0)\2ÿÿB\0\2\1K\0\1\0\0À\tjump\rjumpableM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0À\18change_choice\18choice_active’\1\0\1\v\0\a\0\0246\1\0\0006\3\1\0009\3\2\3B\1\2\4H\4\16€6\6\3\0009\6\4\6\18\b\4\0'\t\5\0\18\n\0\0&\t\n\tB\6\3\2\15\0\6\0X\a\a€6\6\1\0009\6\2\6+\a\0\0<\a\4\0066\6\6\0\18\b\4\0B\6\2\1F\4\3\3R\4î\127K\0\1\0\frequire\6^\tfind\vstring\vloaded\fpackage\npairsO\0\0\3\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\0À\1À\17box.snippets\19reload_package\fcleanupå\2\1\0\n\0\24\0.6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0024\1\0\0003\2\4\0=\2\3\0013\2\6\0=\2\5\0013\2\b\0=\2\a\0013\2\n\0=\2\t\0013\2\f\0=\2\v\0013\2\14\0=\2\r\0016\2\15\0009\2\16\0029\2\17\0025\3\18\0005\4\19\0\18\5\2\0\18\a\3\0'\b\20\0009\t\3\1B\5\4\1\18\5\2\0\18\a\3\0'\b\21\0009\t\a\1B\5\4\1\18\5\2\0\18\a\3\0'\b\22\0009\t\t\1B\5\4\1\18\5\2\0\18\a\4\0'\b\23\0009\t\r\1B\5\4\0012\0\0€K\0\1\0\a,r\n<c-l>\n<c-n>\n<C-R>\1\2\0\0\6n\1\3\0\0\6i\6s\bset\vkeymap\bvim\0\21refresh_snippets\0\19reload_package\0\18change_choice\0\14jump_prev\0\14jump_next\0\19expand_or_jump\fluasnip\17box.snippets\frequire\0" },
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
  ["barbecue.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/box/.local/share/nvim/site/pack/packer/opt/barbecue.nvim",
    url = "https://github.com/utilyre/barbecue.nvim"
  },
  ["blackjack.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/blackjack.nvim",
    url = "https://github.com/alanfortlink/blackjack.nvim"
  },
  ["cellular-automaton.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cellular-automaton.nvim",
    url = "https://github.com/eandrju/cellular-automaton.nvim"
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
  ["copilot.vim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["cord.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tcord\frequire\0" },
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/cord.nvim",
    url = "https://github.com/vyfor/cord.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
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
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
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
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
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
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/box/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: codewindow.nvim
time([[Config for codewindow.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0B\1\1\1K\0\1\0\27apply_default_keybinds\nsetup\15codewindow\frequire\0", "config", "codewindow.nvim")
time([[Config for codewindow.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\na\0\0\5\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\1K\0\1\0\vconfig\27alpha.themes.dashboard\nsetup\nalpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: cord.nvim
time([[Config for cord.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tcord\frequire\0", "config", "cord.nvim")
time([[Config for cord.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nO\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3€-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0À\19expand_or_jump\23expand_or_jumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0À\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2ÿÿB\0\2\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0)\2ÿÿB\0\2\1K\0\1\0\0À\tjump\rjumpableM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4€-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0À\18change_choice\18choice_active’\1\0\1\v\0\a\0\0246\1\0\0006\3\1\0009\3\2\3B\1\2\4H\4\16€6\6\3\0009\6\4\6\18\b\4\0'\t\5\0\18\n\0\0&\t\n\tB\6\3\2\15\0\6\0X\a\a€6\6\1\0009\6\2\6+\a\0\0<\a\4\0066\6\6\0\18\b\4\0B\6\2\1F\4\3\3R\4î\127K\0\1\0\frequire\6^\tfind\vstring\vloaded\fpackage\npairsO\0\0\3\2\3\0\b-\0\0\0009\0\0\0B\0\1\1-\0\1\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\0À\1À\17box.snippets\19reload_package\fcleanupå\2\1\0\n\0\24\0.6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0024\1\0\0003\2\4\0=\2\3\0013\2\6\0=\2\5\0013\2\b\0=\2\a\0013\2\n\0=\2\t\0013\2\f\0=\2\v\0013\2\14\0=\2\r\0016\2\15\0009\2\16\0029\2\17\0025\3\18\0005\4\19\0\18\5\2\0\18\a\3\0'\b\20\0009\t\3\1B\5\4\1\18\5\2\0\18\a\3\0'\b\21\0009\t\a\1B\5\4\1\18\5\2\0\18\a\3\0'\b\22\0009\t\t\1B\5\4\1\18\5\2\0\18\a\4\0'\b\23\0009\t\r\1B\5\4\0012\0\0€K\0\1\0\a,r\n<c-l>\n<c-n>\n<C-R>\1\2\0\0\6n\1\3\0\0\6i\6s\bset\vkeymap\bvim\0\21refresh_snippets\0\19reload_package\0\18change_choice\0\14jump_prev\0\14jump_next\0\19expand_or_jump\fluasnip\17box.snippets\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: competitest.nvim
time([[Config for competitest.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16competitest\frequire\0", "config", "competitest.nvim")
time([[Config for competitest.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd barbecue.nvim ]]

-- Config for: barbecue.nvim
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rbarbecue\frequire\0", "config", "barbecue.nvim")

time([[Sequenced loading]], false)
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
