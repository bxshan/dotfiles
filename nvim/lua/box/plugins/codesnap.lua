return {
  {
    'mistricky/codesnap.nvim',
    build = 'make',
    cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapASCII' },
    opts = {
      save_path = '~/Pictures',
      has_breadcrumbs = true,
      bg_padding = 0,
    },
  }
}
