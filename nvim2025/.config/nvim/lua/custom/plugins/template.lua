return {
  'glepnir/template.nvim',
  cmd = { 'Template', 'TemProject' },
  config = function()
    require('template').setup {
      temp_dir = '~/.config/nvim/templates',
      -- require('template').register('{{_path_}}', function()
      --   vim.fn.expand '%'
      -- end),
    }
  end,
}
