local bufferline = require('bufferline')

-- Cache for expensive diagnostic calculations
local diagnostic_cache = {
  last_update = 0,
  data = { error = 0, warning = 0, info = 0, hint = 0 }
}

bufferline.setup {

   highlights = {
        fill = {
            fg = '#a89984',  -- gruvbox gray
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        background = {
            fg = '#a89984',  -- gruvbox gray (inactive text)
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        tab = {
            fg = '#a89984',  -- gruvbox gray
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        tab_selected = {
            fg = '#fbf1c7',  -- gruvbox light fg0 (bright selected text)
            bg = '#3c3836',  -- gruvbox dark bg1 (selected background)
            bold = true,
        },
        tab_separator = {
            fg = '#1d2021',  -- gruvbox dark bg0_h (separator)
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        tab_separator_selected = {
            fg = '#1d2021',  -- gruvbox dark bg0_h
            bg = '#3c3836',  -- gruvbox dark bg1
        },
        buffer_visible = {
            fg = '#d5c4a1',  -- gruvbox light fg2 (visible but not selected)
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        buffer_selected = {
            fg = '#fbf1c7',  -- gruvbox light fg0 (bright selected text)
            bg = '#3c3836',  -- gruvbox dark bg1 (selected background)
            bold = true,
        },
        close_button = {
            fg = '#a89984',  -- gruvbox gray
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        close_button_visible = {
            fg = '#d5c4a1',  -- gruvbox light fg2
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        close_button_selected = {
            fg = '#fb4934',  -- gruvbox red (danger color for close)
            bg = '#3c3836',  -- gruvbox dark bg1
        },
        separator = {
            fg = '#1d2021',  -- gruvbox dark bg0_h (separator)
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        separator_selected = {
            fg = '#1d2021',  -- gruvbox dark bg0_h
            bg = '#3c3836',  -- gruvbox dark bg1
        },
        numbers = {
            fg = '#a89984',  -- gruvbox gray
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        numbers_visible = {
            fg = '#d5c4a1',  -- gruvbox light fg2
            bg = '#32302f',  -- gruvbox soft dark bg0_s (matches your theme)
        },
        numbers_selected = {
            fg = '#fabd2f',  -- gruvbox yellow (accent for selected)
            bg = '#3c3836',  -- gruvbox dark bg1
            bold = true,
        },
    },

    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        style_preset = { -- no_italic, no_bold, minimal, default
          bufferline.style_preset.no_italic,
          bufferline.style_preset.no_bold,
        },
        themable = true, -- allows highlight groups to be overridden (sets highlights as default)
        numbers = function(opts) -- or "ordinal", "buffer_id", "both", or a function
          return string.format('%s·%s', opts.lower(opts.id), opts.raise(opts.ordinal))
        end,
        close_command = "bdelete! %d",       -- can be a string or function, | false to disable
        right_mouse_command = "bdelete! %d", -- can be a string or function, | false to disable
        left_mouse_command = "buffer %d",    -- can be a string or function, | false to disable
        middle_mouse_command = nil,          -- can be a string or function, | false to disable
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon', -- 'icon', 'underline', or 'none'
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        name_formatter = function(buf)  -- buf contains:
          --return vim.fn.fnamemodify(buf.name, ":t:r")
            -- name | str        | the basename of the active file
            -- path | str        | the full path of the active file
            -- bufnr | int       | the number of the active buffer
            -- buffers | table   | the numbers of the buffers in the tab
            -- tabnr | int       | the "handle" of the tab
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 7,
        diagnostics = "nvim_lsp", -- or "coc", or false
        diagnostics_update_in_insert = false, -- only applies to coc
        diagnostics_update_on_event = true, -- use nvim's diagnostic handler
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and "E" or "W"
          return " " .. icon .. count
        end,
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out based on buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            -- filter out by index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer", -- you can also use a function here
                text_align = "left", -- or "center", "right"
                separator = true,
            }
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
            -- element consists of {filetype: string, path: string, extension: string, directory: string}
            -- This can be used to change how bufferline fetches the icon
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
            return icon, hl
        end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
        duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
        separator_style = "slope", -- "slant", "slope", "thick", "thin", or { 'any', 'any' }
        enforce_regular_tabs = false,

        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            -- Cache diagnostics for performance
            local current_time = vim.loop.hrtime()
            if current_time - diagnostic_cache.last_update > 500000000 then
              diagnostic_cache.data = {
                error = #vim.diagnostic.get(0, { severity = seve.ERROR }),
                warning = #vim.diagnostic.get(0, { severity = seve.WARN }),
                info = #vim.diagnostic.get(0, { severity = seve.INFO }),
                hint = #vim.diagnostic.get(0, { severity = seve.HINT })
              }
              diagnostic_cache.last_update = current_time
            end
            local error = diagnostic_cache.data.error
            local warning = diagnostic_cache.data.warning
            local info = diagnostic_cache.data.info
            local hint = diagnostic_cache.data.hint

            if error ~= 0 then
              table.insert(result, { text = " E " .. error, link = "DiagnosticError" })
            end

            if warning ~= 0 then
              table.insert(result, { text = " W " .. warning, link = "DiagnosticWarn" })
            end

            if hint ~= 0 then
              table.insert(result, { text = " H " .. hint, link = "DiagnosticHint" })
            end

            if info ~= 0 then
              table.insert(result, { text = " I " .. info, link = "DiagnosticInfo" })
            end

            local tabs = vim.fn.tabpagenr('$')
            table.insert(result, { text = "  " .. tabs, link = "TabLine" })

            return result
          end,
        },
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current', -- other options: 'insert_at_end', 'id', etc.
        pick = {
            alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
        },
    }
}
