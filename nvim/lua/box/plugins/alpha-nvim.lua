return {
  {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function()
      local alpha = require("alpha")

      -- ── Default theme ────────────────────────────────────────────────────
      local function setup_default(db)

        -- Set colors
        vim.api.nvim_set_hl(0, "gborange",  { fg = "#fe8019" }) -- gruvbox orange 208
        vim.api.nvim_set_hl(0, "gbyellow", { fg = "#fabd2f" }) -- gruvbox yellow 214
        vim.api.nvim_set_hl(0, "gbaqua", { fg = "#8ec07c" }) -- gruvbox aqua 108

        -- Helpers: collapse the repeated opts table into one-liners
        local function logo(text)  return { type = "text", val = text, opts = { hl = "gborange",  shrink_margin = false, position = "center" } } end
        local function quote(text) return { type = "text", val = text, opts = { hl = "gbyellow", shrink_margin = false, position = "center" } } end

        -- Set header
        db.section.header.type = "group"


        db.section.header.val = {
          logo("                                           .    .                              #     ####                                                                                       "),
          logo("                                    -    .                                             ##                                                                                       "),
          logo("    .               ##               .#.                                                   ####             .                                                                   "),
          logo("          .           ##          .   ### ###                                        #      #####                                         ######                                "),
          logo("                      ###-           ###     ####    .             .    ##                  #####                #                        #########                             "),
          logo("                     ######+   .   ###     #  #### .  . .             ###              .    ######.######                                   ########                            "),
          logo("                   +##+    ##+     #+######                            ######               ###########.           .                        ########          ########          "),
          logo("                 ###.   #######    ####     .                 #          #####      ##############                                          #################### #######        "),
          logo("             .  ##########   +                                           #####      ######   ###     ###                    ##            #########             #########       "),
          logo("     .          #######        .        +#####+    ..  .           #.#.  ####               ####   #########                ##### ########   ######            ###########      "),
          logo("                 ###              #######   #####                        ####               ###### ## ###### #              ########          ####          ###############     "),
          logo("                        ##########         ###-###                       ####### #### ####  ####     #####                 #####                          ##     #########      "),
          logo("         .          ##         ##     ..   #####                        ########  ####       ####    ####                ######                   ########              #       "),
          logo("                     ###        #####     ##+##            .        #########      ###      ######   ####              #######            ########### #####                     "),
          logo("       .    .         ### -#######-      -####              ################        #### ########   ####               ######      ###########                                  "),
          logo("                        ##      ##       ####                ######      ###        ###      ##########                #####          ##                 ####                   "),
          logo("                .       .##     ##      ####                  ##         ###         ###   .##########                  ##                       ##############                 "),
          logo("                   .     ##   ########  ###                              ###         ##########    ##          ##                          ######        #######                "),
          logo("               .         #####. -##     ##                               ###          ##     ##   ################                    #####              ########               "),
          logo("                                 ##       ############      #            ###           #    ########################               #####                 ########               "),
          logo("  .                 .         #+##########       ######                  ###  .##################  ###                               ###       ######   #######                 "),
          logo("                      +######-  ###                 ###                  #############            .###                                ### ########      ######                  "),
          logo("         .#+#--#######.         +##  .                                   ###  #        ###        ####                                ###              ######                   "),
          logo("              -+                +##                  .  .        #       ###             #####     ###                                ####      #####  ######                   "),
          logo("                   .       .    .##                                     ####            # ####    #### #                              ####    ##############                    "),
          logo("                                 ##.                .                   .###       #       ###     ###                                ############  # #####                     "),
          logo("         .                   .   ##               .   .                #####               #      ####                                  ###                                     "),
          logo("                                 ##            .                      #######                .     ###                                                    #######               "),
          logo("                                 ##               .                    #####                      ####                                          ####################            "),
          logo("                         .       #+                   .  .              ####                   #######                                  ##############################          "),
          logo("                                 #           .             .             ##                    ########                         ###############               ########          "),
          logo("                                 #                                                               #####                        ###########                       ######          "),
          logo("               . .                                .                                                ###                           ####                                           "),
          logo("                                                                                       #            #                                                                           "),
        }
      end

      local function setup_name_cao(db)

        -- Set colors
        vim.api.nvim_set_hl(0, "gborange",  { fg = "#fe8019" }) -- gruvbox orange 208
        vim.api.nvim_set_hl(0, "gbyellow", { fg = "#fabd2f" }) -- gruvbox yellow 214
        vim.api.nvim_set_hl(0, "gbaqua", { fg = "#8ec07c" }) -- gruvbox aqua 108

        -- Helpers: collapse the repeated opts table into one-liners
        local function logo(text)  return { type = "text", val = text, opts = { hl = "gborange",  shrink_margin = false, position = "center" } } end
        local function quote(text) return { type = "text", val = text, opts = { hl = "gbyellow", shrink_margin = false, position = "center" } } end

        -- Set header
        db.section.header.type = "group"
        db.section.header.val = {
          logo("                                                                                                                                                                       "),
          logo("                                       #####                                                                                        +                                  "),
          logo("                     ##                 ######                                                  .                                  +#                                  "),
          logo("                     ##                ########                                                -+.                                 ###                                 "),
          logo("                    ####   #         #########                                                 -++                                 +###-                               "),
          logo("                   ##### ##         ########                         +-                        -++                                  ####.                              "),
          logo("                  ########        #######                            ++++--                    ++++++---                             -####                             "),
          logo("                  ######        ######                               ++++++                  .+++++++++                             -+###.                             "),
          logo("                     ###      ######                                 ++++++              .++++++++++++                          -###-                                  "),
          logo("                             #####                                   ++++++         .-.       -##+++                         -###.                                     "),
          logo("                           ####                                      ++++++    +++-           +##+.                        +##+                                        "),
          logo("                         ####            ###                         +++++- +#+++.           ++++-     .                .###+               .-+######+-                "),
          logo("                       ####        ##### #####                      .++++++++++++           +++++.      +-             +##+           -+########++#+######+-           "),
          logo("                      ###      ####      #######                    .+++++++++#+          -++++++.      +++          -###.       +#####-             .+#####-          "),
          logo("                    ###   ######       #########                    .+#++++#+-          +++- ++++     -++++-        ####    -####+-                -####+.             "),
          logo("                   ### #######       ##########                    -+#++++             -++++++++++++++++-.         #### -####+                  -####.                 "),
          logo("                 ###########        ######                 --    -+++#+++-.           ++++#++#++++.               +#######.                   +##+-                    "),
          logo("                 ## ######         ###                     ++++-++#+-+++++            --.    -+++                .####+.                   .###+                       "),
          logo("                      #      ##   #                       -++++++++ .++++-                    +#+                 ##-                    +##+                          "),
          logo("                              #####                       -+++++++  .+++++                    .++++++++.          -                    +##                             "),
          logo("                              ######                      +++++++-   ++++-                      ++++. -+++                           +##-+###.                         "),
          logo("                               #####                      +++++++-   ++++-                              +++                        +#########.                         "),
          logo("                               #####    ##                -++++++-   +++++.                             -++-                       -+-.-###+                           "),
          logo("                                #############               .+++--   +++++-                             .+++                          ####                             "),
          logo("                            ######## ########                        +++++                              -+++                        -###+.--.                          "),
          logo("                    #################                               .+++++-            -  +++           #++-                       -##+-..-###+                        "),
          logo("                        #####   #####                               .+##+++-         +-   -+++         -+++                        +.       -##.                       "),
          logo("                                 #####                               ++#+++.        -+-   -++         .+++.                           -++.  ##-                        "),
          logo("                                 #####                               +++++++.       +++  .#-         -+++                            ##. -###.                         "),
          logo("                                 #####                                -+++++-       .++++-          +++-                             -##-##                            "),
          logo("                          ####   ##### #                               .-+----       +++++-      -+++-                               -+##++###.                        "),
          logo("                             #########                                     .-       .  .+++++#++++-.                                ###+-..###-                        "),
          logo("                                #####                                             .                                                     -##+                           "),
          logo("                                                                                                                                      -+-                              "),
        }
      end

      -- ── ASCII image theme (requires: brew install ascii-image-converter) ──
      local function setup_ascii(db)
        vim.api.nvim_set_hl(0, "gborange",  { fg = "#fe8019" }) -- gruvbox orange 208
        vim.api.nvim_set_hl(0, "gbyellow", { fg = "#fabd2f" }) -- gruvbox yellow 214
        vim.api.nvim_set_hl(0, "gbaqua", { fg = "#8ec07c" }) -- gruvbox aqua 108
        db.section.footer.opts = vim.tbl_deep_extend("force", db.section.footer.opts or {}, {
          hl = { { "gbaqua", 0, -1 } },
          position = "center",
        })

        local image_path = "/Users/box/.config/nvim/lua/box/plugins/assets/adam-and-machine.png"
        local raw = vim.fn.system("ascii-image-converter " .. vim.fn.shellescape(image_path) .. " -b --width 180")
        local lines = vim.split(raw:gsub("\27%[[%d;]*m", ""), "\n", { plain = true })

        db.section.header.type = "group"
        db.section.header.val = vim.tbl_map(function(line)
          return { type = "text", val = line, opts = { hl = "gborange", shrink_margin = false, position = "center" } }
        end, lines)

        local message = {
          type = "text",
          val = "What we assembled with trembling hands, rose to question its maker.",
          opts = { hl = { { "gbaqua", 0, -1 } }, position = "center" },
        }

        db.opts.layout = {
          { type = "padding", val = 2 },
          db.section.header,
          { type = "padding", val = 1 },
          message,
          { type = "padding", val = 1 },
          db.section.buttons,
          db.section.footer,
        }
      end

      local function setup_panda(db)
        -- Set colors
        vim.api.nvim_set_hl(0, "gborange",   { fg = "#fe8019" }) -- gruvbox orange 208
        vim.api.nvim_set_hl(0, "gbyellow",  { fg = "#fabd2f" }) -- gruvbox yellow 214
        vim.api.nvim_set_hl(0, "gbaqua", { fg = "#8ec07c" }) -- gruvbox aqua 108

        -- Helpers: collapse the repeated opts table into one-liners
        local function logo(text)  return { type = "text", val = text, opts = { hl = "gbaqua",  shrink_margin = false, position = "center" } } end

        -- Set header
        db.section.header.type = "group"
        db.section.header.val = {
          logo("                                                                                  "),
          logo("                                                                                  "),
          logo("                      *((##*                                                      "),
          logo("                  /###%%#%&&&%,                           .%((//(/.               "),
          logo("                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            "),
          logo("                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          "),
          logo("                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          "),
          logo("                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         "),
          logo("                   &@,                 .                      /%@@@@@@@&.         "),
          logo("                .(..                  ,                         *#@@@@@#          "),
          logo("              .(                                                 .@@@@*           "),
          logo("              #                                                    (              "),
          logo("             ,             *%@%             .@@@@&*                 ,             "),
          logo("          *            /@@@@@@&            @@@@@@@@&                .*            "),
          logo("          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          "),
          logo("          /           @@@@@@/                  *&@@@@@&                           "),
          logo("         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         "),
          logo("         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         "),
          logo("         *        .     .           /                   , .,.                     "),
          logo("          .                /                     *                      *         "),
          logo("          *                #.    ./%,%/.      ,%                       /..        "),
          logo("          .,                                                        ,,*  *        "),
          logo("            %*                                 (%%#%%(,          *&*..    ,       "),
          logo("           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     "),
          logo("          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    "),
          logo("          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   "),
          logo("        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  "),
          logo("        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* "),
          logo("      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#."),
          logo("      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/"),
          logo("     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/"),
          logo("    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@("),
        }

      end

      local function setup_default_old(db)

        -- Set colors
        vim.api.nvim_set_hl(0, "boxlogo",  { fg = "#fe8019" }) -- gruvbox orange 208
        vim.api.nvim_set_hl(0, "boxquote", { fg = "#fabd2f" }) -- gruvbox yellow 214

        -- Helpers: collapse the repeated opts table into one-liners
        local function logo(text)  return { type = "text", val = text, opts = { hl = "boxlogo",  shrink_margin = false, position = "center" } } end
        local function quote(text) return { type = "text", val = text, opts = { hl = "boxquote", shrink_margin = false, position = "center" } } end

        -- Set header
        db.section.header.type = "group"
        db.section.header.val = {
          logo("              =#=                          @                                      "),
          logo("        :   @.  @*                         =@                     @@              "),
          logo("         @@: .@#                   @@      %@     @                -@. =@@@#      "),
          logo("            @@@@@@@                 @-   @@@@*#*            -    %@@@*.    #@@    "),
          logo("        +*@=*@    @                 @   @@#@@  @@           @@@%-          :      "),
          logo("        @-  =@@+ %@                 @*@@@::@@@ @@           *@     -@@@           "),
          logo("        @@-%@@= -@                @@@  =@  @@@:@             @   -*@@: .          "),
          logo("         @@ *@@@@             @@@   @   @@@@=  @                 @*@@=  @@        "),
          logo("         *@ :@:                     @   -  = @@@@@@@@           -@+.%@. @=        "),
          logo("        #@@*@@+....:-=@@           +@  .#@%=::@                  @-@%#%@.         "),
          logo("   +*##=    *@                     @@%#::@%%  @                  @@@@#*           "),
          logo("            *@                     @#   @     @                  @#               "),
          logo("            +@                     @     @    @                @+.%@@@@@@@@@@     "),
          logo("            *@                             @ @@               #@-                 "),
          logo("            @:                              .:                                    "),
        }

        -- local poems = {
        --   { quote("《登鹳雀楼》"),    quote("白日依山尽，黄河入海流。"),   quote("欲穷千里目，更上一层楼。") },
        --   { quote("《前出塞九首‧其六》"), quote("挽弓当挽强，用箭当用长。"), quote("射人先射马，擒贼先擒王。"), quote("杀人亦有限，列国自有疆。"), quote("苟能制侵陵，岂在多杀伤！") },
        --   { quote("《长歌行》"),      quote("青青园中葵，朝露待日唏。"),   quote("阳春布德泽，万物生光辉。"), quote("常恐秋节至，焜黄华叶衰。"), quote("百川东到海，何时复西归﹖"), quote("少壮不努力，老大徒伤悲。") },
        --   { quote("《天净沙‧秋思》"), quote("枯藤老树昏鸦，小桥流水人家，古道西风瘦马。"), quote("夕阳西下，断肠人在天涯。") },
        --   { quote("《蒹葭》"),        quote("蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。"), quote("蒹葭萋萋，白露未唏。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。"), quote("蒹葭采采，白露未已。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，宛在水中沚。") },
        --   { quote("《春望》"),        quote("国破山河在，城春草木深。"),   quote("感时花溅泪，恨别鸟惊心。"), quote("烽火连三月，家书抵万金。"), quote("白头搔更短，浑欲不胜簪。") },
        --   { quote("《春晓》"),        quote("春眠不觉晓, 处处闻啼鸟。"),   quote("夜来风雨声, 花落知多少。") },
        --   { quote("《望天门山》"),    quote("天门中断楚江开，碧水东流至此回。"), quote("两岸青山相对出，孤帆一片日边来。") },
        -- }
        --
        -- --local numpoem = 8
        -- for _, v in ipairs(poems[math.random(#poems)]) do
        --   table.insert(db.section.header.val, v)
        -- end

      end


      -- ── Shared: applied to every theme ───────────────────────────────────
      local function apply_common(db)
        vim.api.nvim_set_hl(0, "gbaqua", { fg = "#8ec07c" }) -- gruvbox aqua 108
        db.section.footer.opts = vim.tbl_deep_extend("force", db.section.footer.opts or {}, {
          hl = { { "gbaqua", 0, -1 } },
          position = "center",
        })

        db.section.buttons.val = {
          db.button("c", "󰬷  > Comp-Intp", ":cd /Users/box/Desktop/src/HarkerCompIntp<CR> | :Ex<CR>"),
          db.button("s", "󰘬  > 设置",      ":cd ~/.config/nvim/<CR> | :Ex<CR>"),
          db.button("q", "󰅚  > 关闭 NVIM", ":qa<CR>"),
        }

        local version = vim.version()
        db.section.footer.val = os.date("%m月%d日%Y年") .. "・" .. os.date("%H时%M分")
          .. "・共" .. require("lazy").stats().count .. "个插件"
          .. "・" .. version.major .. "." .. version.minor .. "." .. version.patch .. "版本"
      end

      -- ── Theme registry — add new themes below ────────────────────────────
      local themes = {
        default = setup_default,
        ascii   = setup_ascii,
        panda   = setup_panda,
        old     = setup_default_old,
        cao     = setup_name_cao,
      }

      -- ── Theme loader ─────────────────────────────────────────────────────
      local function load_theme(name)
        package.loaded["alpha.themes.dashboard"] = nil
        local db = require("alpha.themes.dashboard")
        local fn = themes[name] or themes.default
        fn(db)
        apply_common(db)
        -- normalize opts (keymap, autostart) and set alpha.default_config;
        -- pcall swallows the "command already exists" error from re-registration
        pcall(alpha.setup, db.opts)
        -- alpha.start returns early if ft=="alpha", swap to temp buf first
        if vim.bo.ft == "alpha" then
          local tmp = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_win_set_buf(0, tmp)
        end
        alpha.start(false, alpha.default_config)
      end

      -- Initial load
      local dashboard = require("alpha.themes.dashboard")
      setup_default(dashboard)
      apply_common(dashboard)
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
          autocmd FileType alpha setlocal nofoldenable
      ]])

      -- :AlphaTheme <name>  (tab-completes registered theme names)
      vim.api.nvim_create_user_command("AlphaTheme", function(args)
        load_theme(args.args)
      end, {
        nargs = 1,
        complete = function() return vim.tbl_keys(themes) end,
      })

    end
  }
}
