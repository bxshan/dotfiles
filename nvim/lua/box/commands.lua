-- USER COMMANDS --

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

-- Screenkey Toggle --
vim.api.nvim_create_user_command("ScreenkeyToggle", function()
  vim.cmd("Screenkey")
  print("sc done")
end, { nargs = 0 })

-- DISCORD WEBHOOK --
-- Channel IDs and webhook URLs are stored in lua/box/secrets.lua (gitignored)
local ok, secrets = pcall(require, 'box.secrets')
local channels = ok and secrets.channels or {}

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
  base_message = base_message:gsub('"', '\"')

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
    vim.uv.sleep(750)
    break
  end
end, { nargs = "*" })
