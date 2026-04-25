-- AUTOCMDS --

-- C/C++ specific remap
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "cc" },
  callback = function()
    vim.keymap.set("n", "<leader>rr", ":CompetiTest run<CR>", {
      buffer = true, silent = true })
  end,
})

-- execute upon opening new buffer
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = { "*.cc", "*.cpp", "*.java", "*.py", "*.lua" },
  callback = function()
    -- Only run for normal buffers, not special ones
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      -- Delay heavy operations to avoid blocking
      vim.defer_fn(function()
        -- Add any per-buffer initialization logic here
      end, 100) -- 100ms delay
    end
  end
})

-- MIPS assembly
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.asm", "*.s"},
  callback = function()
    vim.bo.filetype = "mips"
    vim.keymap.set("n", "<leader><leader>", function()
      local output = vim.fn.system("java -jar " .. vim.fn.expand("~/Desktop/src/mars.jar") .. " nc sm " .. vim.fn.expand("%"))
      print(output)
    end, { buffer = true, desc = "Run MIPS file with MARS" })
  end,
})

-- Java specific options
vim.api.nvim_create_autocmd("FileType", { -- literally 1984
  pattern = "java",
  callback = function()
    vim.opt_local.tabstop = 4      -- Tab character visual width
    vim.opt_local.softtabstop = 4  -- Spaces inserted when hitting Tab
    vim.opt_local.shiftwidth = 4   -- Spaces for auto-indenting (needed for Checkstyle)
    vim.opt_local.expandtab = true -- Turn tabs into spaces
  end,
})
