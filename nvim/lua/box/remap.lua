-- DO NOT TOUCH!!! 
vim.g.mapleader = " "
-- DO NOT TOUCH!!! 

-- ENTER NETRW
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- MOVE BLOCKS OF TEXT IN VISUAL MODE
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- IDK WHAT THIS DOES
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- SOURCE FILE
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- SEARCH AND REPLACE ALL INSTANCES OF WORD UNDER CURSOR
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- DISABLE ARROW KEYS IN NORMAL
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- DISABLE ARROW KEYS IN INSERT 
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

-- ACCEPT ONE WORD IN COPILOT
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')

-- TOGGLE COPILOT
local copilot_on = true 
vim.api.nvim_create_user_command("CopilotToggle", function()
	if copilot_on then
		vim.cmd("Copilot disable")
		print("Copilot OFF")
	else
		vim.cmd("Copilot enable")
		print("Copilot ON")
	end
	copilot_on = not copilot_on
end, { nargs = 0 })
vim.keymap.set("", "<leader>cc", ":CopilotToggle<CR>", { noremap = true, silent = true })

-- GAME OF LIFE AND RAIN ANIMATION --
vim.keymap.set("n", "<leader>lr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>ll", "<cmd>CellularAutomaton game_of_life<CR>")

-- COMPETITEST --
vim.keymap.set('n', '<leader>rr', ":CompetiTest run<CR>")
vim.keymap.set('n', '<leader>tt', ":CompetiTest add_testcase<CR>")

-- CORD --
vim.keymap.set('n', '<leader>cp', function() require('cord.api.command').toggle_presence() end)
vim.keymap.set('n', '<leader>ci', function() require('cord.api.command').toggle_idle_force() end)

-- NEOGEN for javadocs --
vim.keymap.set("n", "<Leader>dd", ":lua require('neogen').generate()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require('neogen').jump_prev<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>df", ":lua require('neogen').jump_next<CR>", opts)

-- TELESCOPE --
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {})
--vim.keymap.set('n', '<leader>fs', function()
--	builtin.grep_string({ search = vim.fn.input("grep > ") });
--end)

-- VIRTUAL TEXT TOGGLE --
local virtual_text_on = true
vim.api.nvim_create_user_command("VirtualTextToggle", function()
	if virtual_text_on then
    vim.diagnostic.config({
      virtual_text = false,
    })
		print("Virtual Text OFF")
	else
    vim.diagnostic.config({
      virtual_text = true,
    })
		print("Virtual Text ON")
	end
	virtual_text_on = not virtual_text_on 
end, { nargs = 0 })
vim.keymap.set("", "<leader>tt", ":VirtualTextToggle<CR>", { noremap = true, silent = true })

