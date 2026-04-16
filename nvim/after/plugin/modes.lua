require('modes').setup({
	colors = {
		bg = "", -- Optional bg param, defaults to Normal hl group
		copy = "#d79921",
		delete = "#cc241d",
		change = "#d65d0e", -- Optional param, defaults to delete
		format = "#b16286",
		insert = "#98971a",
		replace = "#cc241d",
		select = "#458588", -- Optional param, defaults to visual
		visual = "#458588",
	},

	-- Set opacity for cursorline and number background
	line_opacity = 0.15,

	-- Enable cursor highlights
	set_cursor = true,

	-- Enable cursorline initially, and disable cursorline for inactive windows
	-- or ignored filetypes
	set_cursorline = true,

	-- Enable line number highlights to match cursorline
	set_number = true,

	-- Enable sign column highlights to match cursorline
	set_signcolumn = true,

	-- Disable modes highlights for specified filetypes
	-- or enable with prefix "!" if otherwise disabled (please PR common patterns)
	-- Can also be a function fun():boolean that disables modes highlights when true
	ignore = { "NvimTree", "TelescopePrompt", "!minifiles" }
})
