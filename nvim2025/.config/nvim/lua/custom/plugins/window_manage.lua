return {
  {
    'mrjones2014/smart-splits.nvim',
    lazy = false,
    opts = {
      resize_mode = {
        silent = true,
        quit_key = '<leader>wq',
      },
    },
    keys = {
      { '<leader>wr', '<cmd>lua require("smart-splits").start_resize_mode()<cr>', { desc = '[W]indow [R]' } },
      { '<leader>wh', '<cmd>lua require("smart-splits").swap_buf_left()<cr>', { desc = '[W]indow Left' } },
      { '<leader>wj', '<cmd>lua require("smart-splits").swap_buf_down()<cr>', { desc = '[W]indow Down' } },
      { '<leader>wk', '<cmd>lua require("smart-splits").swap_buf_up()<cr>', { desc = '[W]indow Up' } },
      { '<leader>wl', '<cmd>lua require("smart-splits").swap_buf_right()<cr>', { desc = '[W]indow Right' } },
      { '<leader>w|', '<cmd>vsplit<cr>', { desc = 'split [W]indow vertical' } },
      { '<leader>w-', '<cmd>split<cr>', { desc = 'split [W]indow horizontal' } },
    },
  },
  {
    'szw/vim-maximizer',
    keys = {
      { '<leader>wm', '<cmd>MaximizerToggle<CR>', desc = '[W]indow [M]aximize' },
    },
  },
  {
    'anuvyklack/help-vsplit.nvim',
    opts = {
      always = true, -- Always open help in a vertical split.
      side = 'right', -- 'left' or 'right'
      buftype = { 'help' },
      filetype = { 'man' },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
