local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

                                                                                                                       
-- Set colors
vim.api.nvim_set_hl(0, "boxlogo", { fg = "#fe8019" }) -- gruvbox orange 208 
vim.api.nvim_set_hl(0, "boxquote", { fg = "#fabd2f" }) -- gruvbox yellow 214 
vim.api.nvim_set_hl(0, "boxfooter", { fg = "#8ec07c" }) -- gruvbox aqua 108

dashboard.section.footer.opts.hl = "boxfooter"

-- Set header
dashboard.section.header.type = "group"

dashboard.section.header.val = {
  {
    type = "text",
    val = "              =#=                          @                                      ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "        :   @.  @*                         =@                     @@              ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "         @@: .@#                   @@      %@     @                -@. =@@@#      ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "            @@@@@@@                 @-   @@@@*#*            -    %@@@*.    #@@    ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "        +*@=*@    @                 @   @@#@@  @@           @@@%-          :      ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "        @-  =@@+ %@                 @*@@@::@@@ @@           *@     -@@@           ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "        @@-%@@= -@                @@@  =@  @@@:@             @   -*@@: .          ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "         @@ *@@@@             @@@   @   @@@@=  @                 @*@@=  @@        ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "         *@ :@:                     @   -  = @@@@@@@@           -@+.%@. @=        ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "        #@@*@@+....:-=@@           +@  .#@%=::@                  @-@%#%@.         ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "   +*##=    *@                     @@%#::@%%  @                  @@@@#*           ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "            *@                     @#   @     @                  @#               ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "            +@                     @     @    @                @+.%@@@@@@@@@@     ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "            *@                             @ @@               #@-                 ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "            @:                              .:                                    ",
    opts = { hl = "boxlogo", shrink_margin = false, position = "center" },
  },
}
poem1 =
{
  {
    type = "text",
    val = "《登鹳雀楼》", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "白日依山尽，黄河入海流。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "欲穷千里目，更上一层楼。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  }
}
poem2 = 
{
  {
    type = "text",
    val = "《前出塞九首‧其六》", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "挽弓当挽强，用箭当用长。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "射人先射马，擒贼先擒王。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "杀人亦有限，列国自有疆。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "苟能制侵陵，岂在多杀伤！", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
}
poem3 = 
{
  {
    type = "text",
    val = "《长歌行》", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "青青园中葵，朝露待日唏。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "阳春布德泽，万物生光辉。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "常恐秋节至，焜黄华叶衰。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "百川东到海，何时复西归﹖", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "少壮不努力，老大徒伤悲。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  }
}
poem4 = 
{
  {
    type = "text",
    val = "《天净沙‧秋思》", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "枯藤老树昏鸦，小桥流水人家，古道西风瘦马。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "夕阳西下，断肠人在天涯。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
}
poem5 = 
{
  {
    type = "text",
    val = "《蒹葭》", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "蒹葭萋萋，白露未唏。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "蒹葭采采，白露未已。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，宛在水中沚。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
}
poem6 = 
{
  {
    type = "text",
    val = "《春望》",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "国破山河在，城春草木深。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "感时花溅泪，恨别鸟惊心。", 
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "烽火连三月，家书抵万金。",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "白头搔更短，浑欲不胜簪。",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
}
poem7 = 
{
  {
    type = "text",
    val = "《春晓》",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "春眠不觉晓, 处处闻啼鸟。",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "夜来风雨声, 花落知多少。",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
}
poem8 = 
{
  {
    type = "text",
    val = "《望天门山》",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "天门中断楚江开，碧水东流至此回。",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
  {
    type = "text",
    val = "两岸青山相对出，孤帆一片日边来。",
    opts = { hl = "boxquote", shrink_margin = false, position = "center" },
  },
}

numpoem = math.random(1, 8)
--numpoem = 8
if numpoem == 1 then
  for key,value in ipairs(poem1) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 2 then
  for key,value in ipairs(poem2) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 3 then
  for key,value in ipairs(poem3) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 4 then
  for key,value in ipairs(poem4) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 5 then
  for key,value in ipairs(poem5) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 6 then
  for key,value in ipairs(poem6) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 7 then
  for key,value in ipairs(poem7) 
    do
      table.insert(dashboard.section.header.val, value)
    end
elseif numpoem == 8 then
  for key,value in ipairs(poem8) 
    do
      table.insert(dashboard.section.header.val, value)
    end
end

-- Set menu
dashboard.section.buttons.val = {
    --dashboard.button( "w", "󰖬  > 维基百科研究", ":cd ~/Desktop/Desktop - box mac/src/pioneer_boxuan/<CR> | :Ex<CR>"),
    --dashboard.button( "k", "󱚣  > GridWorld项目", ":cd ~/Desktop/Programming Projects/GridWorldCaseStudy/GridWorldCode/projects/boxBug <CR> | :Ex<CR>"),
    --dashboard.button( "r", "  > 最近修改"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > 设置" , ":cd ~/.config/nvim/<CR> | :Ex<CR>"),
    dashboard.button( "q", "󰅚  > 关闭 NVIM", ":qa<CR>"),
}

local currtime = os.date("%H时%M分")
local currdate = os.date("%m月%d日%Y年")
local total_plugins = #vim.tbl_keys(packer_plugins)
local version = vim.version()
local nvim_version_info = version.major .. "." .. version.minor .. "." .. version.patch


dashboard.section.footer.val = currdate .. "・" .. currtime .. "・共" .. total_plugins .. "个插件・" .. nvim_version_info .. "版本"


-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
