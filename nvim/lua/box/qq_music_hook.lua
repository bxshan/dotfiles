-- QQ Music override hook for cord.nvim.
-- Reads /tmp/qq_music_state.json (written by ~/qq_discord_presence/qq_state_writer.py)
-- and mutates cord's activity in-place when QQ Music is active.
--
-- Behavior:
--   * No music             → leave cord's nvim activity untouched
--   * Music playing        → music is primary (album as large_image, song in
--                            details/state, countdown, button); cord's editor
--                            icon becomes a small badge on the album corner,
--                            with current file as hover text
--
-- Bound via cord.nvim's `hooks.post_activity` — runs AFTER cord builds the
-- activity but BEFORE it's sent to Discord. Mutations persist because Lua
-- tables are references.

local M = {}

local STATE_PATH = "/tmp/qq_music_state.json"
local STALE_AFTER_SECONDS = 15

local function read_state()
  local f = io.open(STATE_PATH, "r")
  if not f then return nil end
  local content = f:read("*a")
  f:close()
  if not content or content == "" then return nil end
  local ok, state = pcall(vim.fn.json_decode, content)
  if not ok or type(state) ~= "table" then return nil end
  if not state.updated_at or (os.time() - state.updated_at) > STALE_AFTER_SECONDS then
    return nil
  end
  return state
end

function M.post_activity(opts, activity)
  local dbg = io.open("/tmp/qq_hook_debug.log", "a")
  if dbg then
    local state_exists = io.open(STATE_PATH, "r")
    if state_exists then state_exists:close() end
    dbg:write(os.date("%H:%M:%S") ..
              " called  state_file=" .. tostring(state_exists ~= nil) ..
              "  filename=" .. tostring(opts and opts.filename) ..
              "  cur_large_image=" .. tostring(activity.assets and activity.assets.large_image) ..
              "\n")
    dbg:close()
  end
  -- idempotency: if we already mutated this activity (e.g. hook registered twice),
  -- bail before we treat our own album_url as "cord's icon" and stamp it as small_image
  if activity.assets and activity.assets.large_text == "QQ Music" then return end

  local state = read_state()
  if not state then return end  -- no music → leave cord's activity untouched

  -- snapshot cord's editor info before we overwrite
  local cord_large_image = activity.assets and activity.assets.large_image
  local cord_large_text  = activity.assets and activity.assets.large_text
  local cord_filename    = opts and opts.filename

  -- music-centric details/state
  if state.is_playing then
    activity.details = state.title
  else
    activity.details = "⏸ " .. state.title
  end

  if state.album and state.album ~= "" and state.album ~= state.title then
    activity.state = state.artist .. " · " .. state.album
  else
    activity.state = state.artist
  end

  -- album as the primary visual; nvim icon shrinks into the small badge slot
  activity.assets = activity.assets or {}
  if state.artwork_url then
    activity.assets.large_image = state.artwork_url
  end
  activity.assets.large_text = "QQ Music"

  if cord_large_image then
    activity.assets.small_image = cord_large_image
    activity.assets.small_text  = cord_filename or cord_large_text or "Neovim"
  else
    activity.assets.small_image = nil
    activity.assets.small_text  = nil
  end

  activity.timestamps = {}
  if state.is_playing and state.end_ts then
    activity.timestamps["end"] = state.end_ts
  end

  if state.song_url then
    activity.buttons = { { label = "Play on QQ Music", url = state.song_url } }
  else
    activity.buttons = nil
  end
end

return M
