return {
  {
    'gen740/SmoothCursor.nvim',
    enabled = false,
    config = function()
      require('smoothcursor').setup()
    end,
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
}
