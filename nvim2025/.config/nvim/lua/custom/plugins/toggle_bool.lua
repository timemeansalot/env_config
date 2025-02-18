return {
  'gerazov/vim-toggle-bool',
  dependencies = { 'AndrewRadev/switch.vim' },
  keys = {
    { '<leader>tt', '<cmd>ToggleBool<CR>', desc = '[T]oggle [B]ool ' },
  },
}
