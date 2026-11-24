return {
  {
    "mistricky/codesnap.nvim",
    cmd = { "CodeSnap", "CodeSnapSave" },
    config = function()
      require("codesnap").setup({
        save_path = "~/Pictures/Snaps",
        has_breadcrumbs = true,
        bg_theme = "bamboo",
      })
    end,
  },
}
