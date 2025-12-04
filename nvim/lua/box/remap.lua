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
-- vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')

-- TOGGLE COPILOT -- TODO copilot is disabled rn
--local copilot_on = true 
--vim.api.nvim_create_user_command("CopilotToggle", function()
--	if copilot_on then
--		vim.cmd("Copilot disable")
--		print("Copilot OFF")
--	else
--		vim.cmd("Copilot enable")
--		print("Copilot ON")
--	end
--	copilot_on = not copilot_on
--end, { nargs = 0 })
--vim.keymap.set("", "<leader>cc", ":CopilotToggle<CR>", { noremap = true, silent = true })

-- GAME OF LIFE AND RAIN ANIMATION --
vim.keymap.set("n", "<leader>lr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>ll", "<cmd>CellularAutomaton game_of_life<CR>")

-- COMPETITEST --
-- vim.keymap.set('n', '<leader>rr', ":CompetiTest run<CR>") // changed to only run on cpp files; conflict with magma notebook
-- C/C++ specific remap
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "cc" },
  callback = function()
    vim.keymap.set("n", "<leader>rr", ":CompetiTest run<CR>", {
      buffer = true, silent = true })
    end,
  })

vim.keymap.set('n', '<leader>tt', ":CompetiTest add_testcase<CR>")

-- CORD --
vim.keymap.set('n', '<leader>cp', function() require('cord.api.command').toggle_presence() end)
vim.keymap.set('n', '<leader>ci', function() require('cord.api.command').toggle_idle_force() end)

-- NEOGEN for javadocs --
vim.keymap.set("n", "<Leader>dd", ":lua require('neogen').generate()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>ds", ":lua require('neogen').jump_prev<CR>", opts)
--vim.api.nvim_set_keymap("n", "<Leader>df", ":lua require('neogen').jump_next<CR>", opts)

-- TELESCOPE --
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, {})
-- vim.keymap.set('n', '<leader>fs', function()
-- 	builtin.grep_string({ search = vim.fn.input("grep > ") });
-- end)

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
vim.keymap.set("", "<leader>vt", ":VirtualTextToggle<CR>", { noremap = true, silent = true })

-- Screenkey Toggle --
vim.api.nvim_create_user_command("ScreenkeyToggle", function()
  vim.cmd("Screenkey")
  print("sc done")
end, { nargs = 0 })

-- AUTOCMDS --
  -- excecute upon opening new buffer
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = { "*.cc", "*.cpp", "*.java", "*.py", "*.lua" },
  callback = function()
    -- Only run for normal buffers, not special ones
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      -- Delay heavy operations to avoid blocking
      vim.defer_fn(function()
        -- require("codewindow").open_minimap();
        -- vim.cmd("Screenkey") -- Removed: handled by screenkey.lua autocmd
      end, 100) -- 100ms delay
    end
  end
})

-- WHICH KEYS --

local status_ok, wk = pcall(require, "which-key")
if status_ok then
  wk.add({
    { "<leader>f", group = "file" }, -- group
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
    { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
    { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
  })
end

-- tabs --
local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>1', function() require('bufferline').go_to(1, true) end, opts)
vim.keymap.set('n', '<leader>2', function() require('bufferline').go_to(2, true) end, opts)
vim.keymap.set('n', '<leader>3', function() require('bufferline').go_to(3, true) end, opts)
vim.keymap.set('n', '<leader>4', function() require('bufferline').go_to(4, true) end, opts)
vim.keymap.set('n', '<leader>5', function() require('bufferline').go_to(5, true) end, opts)
vim.keymap.set('n', '<leader>6', function() require('bufferline').go_to(6, true) end, opts)
vim.keymap.set('n', '<leader>7', function() require('bufferline').go_to(7, true) end, opts)
vim.keymap.set('n', '<leader>8', function() require('bufferline').go_to(8, true) end, opts)
vim.keymap.set('n', '<leader>9', function() require('bufferline').go_to(9, true) end, opts)
vim.keymap.set('n', '<leader>0', function() require('bufferline').go_to(-1, true) end, opts)

-- Navigate through buffers in order
vim.keymap.set('n', '<leader>,', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<leader>.', ':BufferLineCyclePrev<CR>', opts)

-- Close current buffer
vim.keymap.set('n', '<leader>ww', ':bd<CR>', opts)

-- duplicate line + comment first line
vim.keymap.set("n", "ycc", "yygccp", { remap = true })

-- search within visual area only
vim.keymap.set("x", "/", "<Esc>/\\%V")

-- keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z:delmarks z<cr>")

-- Define a single table containing both channel IDs and webhook URLs
local channels = {
  --counting = {
  --  id = "1250128415441293342", 
  --  webhook = ""
  --},
  spam = {
    id = "1241570045449076777",
    webhook = "https://discord.com/api/webhooks/1365572312744595537/dUbh190oZz-yp5hfMhdOjApYQ3A02kWVxaNh4q7L8bQBsKHQKeiC-LyQW3whsmLirhjE",
  },
  general = {
    id = "1285859798746660874",
    webhook = "https://discord.com/api/webhooks/1365802638490337290/MuST1o633r23iaIT1WIZMQZkkxHxe2XZl3huhQrycIWzWk3RTpJ-_ftTrTbtU8SJMqXJ"
  }, 
  -- Add more channels here as needed
}

-- Command to send a message to a channel repeatedly
vim.api.nvim_create_user_command("Discord", function(opts)
  -- Check if valid channel name and message are provided
  if #opts.fargs < 2 then
    print("Usage: :Discord <channel_name> <message>")
    return
  end

  -- The first argument is the channel name
  local channel_name = opts.fargs[1]

  -- Check if the channel name exists
  local channel_info = channels[channel_name]
  if not channel_info then
    print("Error: Channel not found. Valid channels are: general, spam")
    return
  end

  -- The rest of the arguments are the message
  local base_message = table.concat(opts.fargs, " ", 2)

  -- Escape quotes for JSON
  base_message = base_message:gsub('"', '\\"')

  -- Local counter variable
  local counter = 0

  -- Infinite loop
  while true do
    counter = counter + 1

    -- Final message with counter appended
    local final_message = string.format("%s #%d", base_message, counter)

    -- Send the message using curl
    local cmd = string.format(
      [[curl -s -X POST -H "Content-Type: application/json" -d '{"content":"%s"}' "%s"]],
      final_message,
      channel_info.webhook
    )
    os.execute(cmd)

    -- OPTIONAL: sleep a bit between messages (e.g., 1 second)
    vim.loop.sleep(750) -- sleep for 1000ms = 1 second -- sleep for 1000 ms = 1 second
    break
  end
end, { nargs = "*" })

-- enable copy and past from system clipboard
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- Remap to search and replace within visual selection
vim.keymap.set('v', '<leader>r', [[:<C-u>lua ReplaceInVisualSelection()<CR>]], { noremap = true, silent = true })

-- Function to prompt for find/replace in visual mode
function ReplaceInVisualSelection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local range = string.format(":%d,%ds/", s_start[2], s_end[2])
  local find = vim.fn.input("f ")
  if find == "" then return end
  local replace = vim.fn.input("r ")
  local cmd = range .. vim.fn.escape(find, '/') .. '/' .. vim.fn.escape(replace, '/') .. '/g'
  vim.cmd(cmd)
end

-- MOLTEN jupyter notebook remaps
-- Python/Jupyter specific remaps for Molten
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "jupyter" },
  callback = function()
    local opts = { buffer = true, silent = true, noremap = true }

    -- Evaluate line
    vim.keymap.set("n", "<leader>rr", ":MoltenEvaluateLine<CR>", opts)

    -- Evaluate visual selection
    vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv", opts)

    -- Evaluate operator
    vim.keymap.set("n", "<leader>r", ":MoltenEvaluateOperator<CR>", { buffer = true, silent = true, expr = true })

    -- Re-evaluate current cell
    vim.keymap.set("n", "<leader>rc", ":MoltenReevaluateCell<CR>", opts)

    -- Delete current cell
    vim.keymap.set("n", "<leader>rd", ":MoltenDelete<CR>", opts)

    -- Show/hide output
    vim.keymap.set("n", "<leader>ro", ":MoltenHideOutput<CR>", opts)
    vim.keymap.set("n", "<leader>rO", ":MoltenShowOutput<CR>", opts)

    -- Initialize Python kernel
    vim.keymap.set("n", "<leader>ri", ":MoltenInit python3<CR>", opts)

    -- Interrupt kernel
    vim.keymap.set("n", "<leader>rq", ":MoltenInterrupt<CR>", opts)

    -- Restart kernel
    vim.keymap.set("n", "<leader>rR", ":MoltenRestart!<CR>", opts)
  end,
})
