
return {
  {
    'greggh/claude-code.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('claude-code').setup({
        window = { position = 'vertical botright', split_ratio = 0.4 },
        git = { use_git_root = false, multi_instance = false },
        shell = { separator = ';', pushd_cmd = 'cd', popd_cmd = 'true' },
        keymaps = { toggle = { variants = { verbose = '<leader>cc' } } }
      })
    end
  }
}
