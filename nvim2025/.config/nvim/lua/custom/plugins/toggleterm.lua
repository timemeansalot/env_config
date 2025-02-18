return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 20,
      -- FIX: Curry, need to fix the confict between tmux-navigator
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      autochdir = false,
      direction = 'float',
      auto_scroll = true,
      float_opts = {
        border = 'curved',
      },
    },
    keys = {
      { '<leader>tf', '<cmd>ToggleTerm<cr>', { desc = { '[T]oggleTerm [F]loat' } } },
    },
  },
}
