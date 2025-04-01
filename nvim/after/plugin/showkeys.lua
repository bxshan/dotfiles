local showkeys = require('showkeys')
--keys = {},
--w = 1,
--extmark_id = nil,

showkeys.setup({
  -- :h nvim_open_win() 
  -- ^ for params of below
  winopts = {
    focusable = false,
    relative = "editor",
    style = "minimal",
    border = "rounded",
    height = 1,
    row = 1,
    col = 0,
    zindex = 100,
  },

  winhl = "FloatBorder:Comment,Normal:Normal",

  timeout = 3, -- in secs
  maxkeys = 5,
  show_count = true,
  excluded_modes = {}, -- example: {"i"}

  -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
  position = "bottom-right",

  keyformat = {
    ["<BS>"] = "󰁮 ",
    ["<CR>"] = "󰘌",
    ["<Space>"] = "󱁐",
    ["<Up>"] = "󰁝",
    ["<Down>"] = "󰁅",
    ["<Left>"] = "󰁍",
    ["<Right>"] = "󰁔",
    ["<PageUp>"] = "Page 󰁝",
    ["<PageDown>"] = "Page 󰁅",
    ["<M>"] = "Alt",
    ["<C>"] = "Ctrl",
  },
})
