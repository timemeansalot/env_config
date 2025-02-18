return {
  'tomasky/bookmarks.nvim',
  -- tag = 'release' -- To use the latest release
  event = 'VimEnter',
  opts = {
    -- sign_priority = 8,  --set bookmark sign priority to cover other sign
    save_file = vim.fn.expand '$HOME/.cache/nvim/.bookmarks', -- bookmarks save file path
    keywords = {
      ['@t'] = '☑️ ', -- mark annotation startswith @t ,signs this icon as `Todo`
      ['@w'] = '⚠️ ', -- mark annotation startswith @w ,signs this icon as `Warn`
      ['@f'] = '⛏ ', -- mark annotation startswith @f ,signs this icon as `Fix`
      ['@n'] = ' ', -- mark annotation startswith @n ,signs this icon as `Note`
    },
    -- on_attach = function()
    --   local bm = require 'bookmarks'
    --   local map = vim.keymap.set
    --   -- map('n', 'mi', bm.bookmark_ann, {}) -- add or edit mark annotation at current line
    --   -- map('n', 'mc', bm.bookmark_clean) -- clean all marks in local buffer
    --   -- map('n', 'mn', bm.bookmark_next) -- jump to next mark in local buffer
    --   -- map('n', 'mp', bm.bookmark_prev) -- jump to previous mark in local buffer
    -- end,
  },

  keys = {
    {
      '<leader>mt',
      function()
        require('bookmarks').bookmark_toggle()
      end,
      desc = '[M]ark [T]oggle',
    },
    {
      '<leader>ml',
      function()
        require('telescope').extensions.bookmarks.list()
      end,
      desc = '[M]ark [L]ist',
    },
    {
      '<leader>mc',
      function()
        require('bookmarks').bookmark_clear_all()
      end,
      desc = '[M]ark [C]lear All',
    },
    {
      '<leader>mC',
      function()
        require('bookmarks').bookmark_clean()
      end,
      desc = '[M]ark [C]lear',
    },
    {
      '<leader>ma',
      function()
        require('bookmarks').bookmark_ann()
      end,
      desc = '[M]ark [A]nnotate',
    },
    {
      '<leader>mn',
      function()
        require('bookmarks').bookmark_next()
      end,
      desc = 'jump to [M]ark [N]ext in current buffer',
    },
    {
      '<leader>mp',
      function()
        require('bookmarks').bookmark_prev()
      end,
      desc = 'jump to [M]ark [P]rev in current buffer',
    },
  },
}
