return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
    keys = {
      { '<leader>md', ':MarkdownPreviewToggle<CR>', desc = '[M]ark[D]own preview toggle' },
    },
  },
  {
    'yelog/marklive.nvim',
    enabled = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    lazy = true,
    ft = 'markdown',
    opts = {},
  },
  { 'bullets-vim/bullets.vim' },
}
