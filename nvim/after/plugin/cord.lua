require('cord').setup {
  enabled = true,
  log_level = vim.log.levels.OFF,
  editor = {
    client = 'neovim',
    tooltip = 'better than vscode',
    icon = nil,
  },
  display = {
    theme = 'atom',
    flavor = 'light',
    swap_fields = false,
    swap_icons = true,
  },
  timestamp = {
    enabled = true,
    reset_on_idle = false,
    reset_on_change = false,
  },
  idle = {
    enabled = true,
    timeout = 300000,
    show_status = true,
    ignore_focus = true,
    unidle_on_focus = true,
    smart_idle = true,
    details = 'Being Distracted',
    state = nil,
    tooltip = 'Idle',
    icon = nil,
  },
  text = {
    workspace = function(opts) return 'In ' .. opts.workspace end,
    viewing = function(opts) return 'Viewing ' .. opts.filename end,
    --editing = function(opts) return 'Editing ' .. opts.filename end,
    editing = function(opts) 
      return string.format('Editing %s at %s:%s', opts.filename, opts.cursor_line, opts.cursor_char) 
    end,
    file_browser = function(opts) return 'Browsing files in ' .. opts.name end,
    plugin_manager = function(opts) return 'Managing plugins in ' .. opts.name end,
    lsp = function(opts) return 'Configuring LSP in ' .. opts.name end,
    docs = function(opts) return 'Reading ' .. opts.name end,
    vcs = function(opts) return 'Committing changes in ' .. opts.name end,
    notes = function(opts) return 'Taking notes in ' .. opts.name end,
    debug = function(opts) return 'Debugging in ' .. opts.name end,
    test = function(opts) return 'Testing in ' .. opts.name end,
    diagnostics = function(opts) return 'Fixing problems in ' .. opts.name end,
    games = function(opts) return 'Playing ' .. opts.name end,
    terminal = function(opts) return 'Running commands in ' .. opts.name end,
    dashboard = 'Home',
  }, 
  --buttons = nil,
  buttons = {
    --{
    --  label = 'View Repository',
    --  url = function(opts) return opts.repo_url end,
    --},
    --{
    --  label = function(opts)
    --    return 'Website'
    --  end,
    --  url = function(opts)
    --    return 'github.com'
    --  end
    --}
  },
  assets = nil,
  variables = nil,
  hooks = {
    ready = nil,
    shutdown = nil,
    pre_activity = nil,
    --pre_activity = function(opts, activity)
    --  local date = os.date('*t')
    --  date.hour, date.min, date.sec = 0, 0, 0
    --  activity.timestamps.start = os.time(date)
    --end,
    post_activity = nil,
    idle_enter = nil,
    -- optionally, you can do one of the two:
    -- A. also set local time for idle status, or
    --idle_enter = function(opts, activity)
    --  local date = os.date('*t')
    --  date.hour, date.min, date.sec = 0, 0, 0
    --  activity.timestamps.start = os.time(date)
    --end,
    idle_leave = nil,
    workspace_change = nil,
  },
  plugins = nil,
  advanced = {
    plugin = {
      autocmds = true,
      cursor_update = 'on_hold',
      match_in_mappings = true,
    },
    server = {
      update = 'fetch',
      pipe_path = nil,
      executable_path = nil,
      timeout = 300000,
    },
    discord = {
      reconnect = {
        enabled = true,
        interval = 5000,
        initial = true,
      },
    },
  },
}
