return {
  'akinsho/bufferline.nvim',
  version = '*',
  lazy = false,
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'buffers',
      numbers = 'ordinal',
      show_buffer_close_icons = false,
      color_icons = false,
      left_trunc_marker = '',
      right_trunc_marker = '',
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
    },
  },
  keys = {
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'pin buffer' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'go to left hand buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'go toright hand buffer' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'close other buffers' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = 'close all left buffers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = 'close all right buffers' },
    { '<leader>bx', '<cmd>bd<cr>', desc = 'close current buffers' },
  },
}
