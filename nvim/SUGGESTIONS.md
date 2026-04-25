# Neovim Config Suggestions

## 1. [DONE] Migrate from Packer to lazy.nvim

**File:** `lua/box/packer.lua`

Packer is unmaintained. lazy.nvim is now the standard and offers:
- Lazy loading built-in (no more `event = "InsertEnter"` workarounds)
- Lockfile (`lazy-lock.json`) for reproducible installs
- Faster startup via automatic lazy loading
- Better UI for managing plugins

The entire `lua/box/packer.lua` would be replaced by a `lua/box/lazy.lua` (or split into per-plugin spec files). The `plugin/packer_compiled.lua` file would be deleted.

---

## 2. [DONE] Replace mason.lua LSP handlers (they're broken)

**File:** `after/plugin/mason.lua`

The handlers in `mason.lua` are a no-op:

```lua
handlers = {
  function(clangd)   -- "clangd" is just the param name, not used
    require('lspconfig')['clangd'].setup({})  -- empty config, ignores capabilities
  end,
```

Each handler uses the server name as a variable name but never uses it. The actual LSP setup with capabilities is done correctly in `after/plugin/lsp.lua` via `vim.lsp.config` + `vim.lsp.enable`. The mason handlers are redundant and call `lspconfig.setup({})` with no capabilities, which may conflict. The handlers block in `mason.lua` should be removed entirely.

---

## 3. [DONE] Use `vim.lsp.config` / `vim.lsp.enable` exclusively (0.11+)

**File:** `after/plugin/lsp.lua`

This is already done correctly — you're using the new `vim.lsp.config` / `vim.lsp.enable` API introduced in Neovim 0.11. Good. The mason handlers calling `lspconfig` alongside this is the conflict to fix (see above).

---

## 4. [DONE] Duplicate `mapleader` definition

**Files:** `lua/box/set.lua:51`, `lua/box/remap.lua:2`

`vim.g.mapleader = " "` is set in both files. It only needs to be set once, before any keymaps are defined. Keep it at the top of `remap.lua` (or move it to `init.lua` before requiring anything), and remove it from `set.lua`.

---

## 5. [DONE] Remove dead code and commented-out blocks

Several plugins are commented out but still taking up space:

- `lua/box/packer.lua`: Barbecue, Noice, copilot.vim, molten-nvim, hardtime, nvim-lint (repeated), barbar
- `lua/box/remap.lua`: CopilotToggle command, multiple commented keymaps
- `after/plugin/bufferline.lua`: `name_formatter` returns nothing (empty function body)

Clean these out. If you want to track "things to try later," a `TODO.md` is better than commented code scattered through config files.

---

## 6. [DONE] Exposed Discord webhook URLs

**File:** `lua/box/remap.lua:186-192`

The `channels` table contains hardcoded Discord webhook URLs. These are essentially passwords — anyone with them can post to your server. Move them to an env var or an untracked local file (e.g., `lua/box/secrets.lua` added to `.gitignore`).

---

## 7. [DONE] `ReplaceInVisualSelection` is a global function

**File:** `lua/box/remap.lua:253`

```lua
function ReplaceInVisualSelection()  -- global!
```

This pollutes the global namespace. Use `local function` and assign it via a closure or upvalue in the keymap.

---

## 8. [DONE] Molten keymaps for a plugin that isn't installed

**File:** `lua/box/remap.lua:266-298`

There's a full set of Molten (Jupyter) keymaps, but `molten-nvim` is commented out in `packer.lua`. These autocmds fire on every Python file open and register keymaps pointing to non-existent commands. Either install molten or remove these keymaps.

---

## 9. [DONE] Hardtime keymap for a plugin that isn't installed

**File:** `lua/box/remap.lua:305`

Same issue — hardtime is commented out in packer but the toggle keymap is still active.

---

## 10. [DONE] `opts` used before definition

**File:** `lua/box/remap.lua:75`

```lua
vim.keymap.set("n", "<Leader>dd", ":lua require('neogen').generate()<CR>", opts)
```

`opts` is defined on line 149 as `{ noremap = true, silent = true }`. This line uses it before it's defined, so `opts` is `nil` here. Define `opts` at the top of the file.

---

## 11. [DONE] Treesitter folding is already configured — nvim-ufo may be redundant

**File:** `lua/box/set.lua:56-61`, `after/plugin/ufo.lua`

You have treesitter-based folds (`foldmethod = "expr"`, `foldexpr = "v:lua.vim.treesitter.foldexpr()"`) set natively, which works well in 0.10+. nvim-ufo adds fold preview and LSP-based folds but also overrides `foldmethod`. Check if you actually use ufo's features (peek fold, LSP folds). If not, remove it — native treesitter folds are sufficient.

---

## 12. [DONE] `vim.loop` is deprecated — use `vim.uv`

**File:** `lua/box/remap.lua:238`, `after/plugin/bufferline.lua:172`

`vim.loop` was aliased to `vim.uv` in Neovim 0.10 and `vim.loop` is deprecated as of 0.11. Replace:
- `vim.loop.sleep(750)` → `vim.uv.sleep(750)`
- `vim.loop.hrtime()` → `vim.uv.hrtime()`

---

## 13. [DONE] Telescope `file_ignore_patterns` is too aggressive

**File:** `after/plugin/telescope.lua`

```lua
file_ignore_patterns = { ".ctxt", ".class", ".bluej", ".out", ".txt", ".json" }
```

These are substring matches, not extensions. `.txt` will ignore any path containing "txt" (e.g., a directory named `fixtures`). Use proper patterns: `"%.txt$"`, `"%.json$"`, etc. Also consider whether you actually want to ignore `.txt` and `.json` globally.

---

## 14. [DONE] Split `remap.lua` by concern

**File:** `lua/box/remap.lua`

At 307 lines, `remap.lua` mixes: general keymaps, filetype-specific autocmds, user commands (Discord, VirtualTextToggle, ScreenkeyToggle), which-key setup, buffer navigation, and Neovide clipboard maps. Consider splitting:

- `lua/box/keymaps.lua` — general keymaps
- `lua/box/autocmds.lua` — all autocmd definitions
- `lua/box/commands.lua` — user commands

The filetype-specific keymaps (MIPS in `set.lua`, C++ and Python in `remap.lua`) should all live in the same place.

---

## 15. [DONE] MIPS autocmd uses a hardcoded absolute path

**File:** `lua/box/set.lua:14`

```lua
local output = vim.fn.system("java -jar /Users/box/Desktop/src/mars.jar nc sm " .. vim.fn.expand("%"))
```

This breaks on any other machine. Use `vim.fn.expand("~/Desktop/src/mars.jar")` or make it a config variable at the top of the file.

---

## 16. [DONE] `cmp.lua` highlight groups use VS Code colors, not gruvbox

**File:** `after/plugin/cmp.lua:14-28`

The hardcoded hex colors (`#569CD6`, `#9CDCFE`, `#C586C0`) are VS Code's dark theme colors. They look out of place with gruvbox. Either remove the custom highlights (lspkind handles them well by default) or update them to match gruvbox's palette.

---

## 17. [DONE] `which-key.lua` is just the defaults

**File:** `after/plugin/which-key.lua`

The entire file duplicates the which-key defaults verbatim (copied from the docs). Call `require('which-key').setup({})` or only override what you actually change. The actual group registrations happen in `remap.lua` — move the `setup()` call there or to the plugin spec.

---

## 18. [DONE] `lualine.lua` has a global `return_text` variable

**File:** `after/plugin/lualine.lua:8`

```lua
return_text = return_text_1  -- global, no `local`
```

This is a global variable. Add `local`.

---

## 19. [DONE] Consider `vim.diagnostic.config` in one place

**File:** `lua/box/remap.lua:87-100`, `after/plugin/lsp.lua`

The `VirtualTextToggle` command toggles `vim.diagnostic.config` but the initial diagnostic config is never explicitly set anywhere. Add an explicit `vim.diagnostic.config({...})` call in `lsp.lua` with your preferred defaults (virtual text on/off, signs, etc.) so the starting state is defined.

---

## 20. Neovim 0.11+ native completion as an option

Neovim 0.11 ships with a built-in completion engine (`vim.lsp.completion`). It's simpler than the nvim-cmp stack (cmp + luasnip + lspkind + cmp-nvim-lsp + cmp-cmdline + cmp_luasnip + friendly-snippets = 7 plugins). If you primarily use LSP completion and don't need complex snippet workflows, the native completion is worth evaluating — it would remove 7 plugins.

---

## Summary Table

| Priority | Item | Effort |
|----------|------|--------|
| High (DONE) | Fix mason.lua broken handlers (#2) | Low (DONE) |
| High (DONE) | Fix `opts` used before definition (#10) | Low (DONE) |
| High (DONE) | Remove exposed webhook URLs (#6) | Low (DONE) |
| High (DONE) | Replace `vim.loop` with `vim.uv` (#12) | Low (DONE) |
| Medium (DONE) | Remove dead Molten/Hardtime keymaps (#8, #9) | Low (DONE) |
| Medium (DONE) | Fix Telescope ignore patterns (#13) | Low (DONE) |
| Medium (DONE) | Make MIPS path portable (#15) | Low (DONE) |
| Medium (DONE) | Clean commented-out plugin blocks (#5) | Medium (DONE) |
| Medium (DONE) | Deduplicate mapleader (#4) | Low (DONE) |
| Medium (DONE) | Make `ReplaceInVisualSelection` local (#7) | Low (DONE) |
| Medium (DONE) | Fix global `return_text` in lualine (#18) | Low (DONE) |
| Low (DONE) | Migrate packer -> lazy.nvim (#1) | High (DONE) |
| Low (DONE) | Split remap.lua by concern (#14) | Medium (DONE) |
| Low | Evaluate native completion vs cmp stack (#20) | High |
| Low (DONE) | Trim which-key.lua to only overrides (#17) | Low (DONE) |
| Low (DONE) | Evaluate nvim-ufo vs native folds (#11) | Low (DONE) |
| Low (DONE) | Fix cmp highlight colors (#16) | Low (DONE) |
| Low (DONE) | Consider `vim.diagnostic.config` in one place (#19) | Low (DONE) |
