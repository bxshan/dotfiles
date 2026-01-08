if vim.g.neovide then
  vim.print(vim.g.neovide_version)
  vim.g.neovide_cursor_vfx_mode = { "railgun", } --  "wireframe" }
  -- vim.g.neovide_cursor_vfx_mode = { 
  --   "railgun", 
  --   "torpedo", 
  --   "pixiedust",
  --   "sonicboom", 
  --   "ripple", 
  --   "wireframe",
  -- }
  
  -- vfx
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.3
  vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
  vim.g.neovide_cursor_vfx_particle_density = 0.7
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  -- railgun only
  vim.g.neovide_cursor_vfx_particle_phase = 5.0
  vim.g.neovide_cursor_vfx_particle_curl = 5.0

  -- fonts
  -- vim.o.guifont = "FiraCode Nerd Font,AaHuayuziluolanyongheng:h14"
  vim.o.guifont = "Comic Sans MS,AaHuayuziluolanyongheng:h14:w-8"

  -- line spacing 
  -- vim.opt.linespace = 0 -- any ints work, even negative; zero should be fine
  vim.opt.linespace = -7 -- any ints work, even negative; zero should be fine

  -- font scale
  vim.g.neovide_scale_factor = 1.5 -- float val 
  -- vim.g.neovide_scale_factor = 1.2 -- float val 

  -- text gamma and contrast
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5

  -- border padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  -- transparency
  vim.g.neovide_opacity = 0.85
  vim.g.neovide_normal_opacity = 0.85
  
  vim.g.neovide_confirm_quit = true
  

  -- fullscreen options
  vim.g.neovide_fullscreen = false 
  -- hides dock and menu bar
  vim.g.neovide_macos_simple_fullscreen = false 

  -- fps graph
  -- vim.g.neovide_profiler = true 

  -- "Interprets Alt + whatever actually as <M-whatever>, instead of sending the actual special character to Neovim"
  vim.g.neovide_input_macos_option_key_is_meta = 'both'

  -- cursor animation 
  vim.g.neovide_cursor_animation_length = 0.100
  -- for horizontal, eg. when typing
  vim.g.neovide_cursor_short_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.40
  vim.g.neovide_cursor_animate_in_insert_mode = false 
  vim.g.neovide_cursor_animate_command_line = true

  -- bring cmd+c and cmd+v for copy and paste
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode 

  -- copy and past from clipboard are mapped in remap.lua

end
