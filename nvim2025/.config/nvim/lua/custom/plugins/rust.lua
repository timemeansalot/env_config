return {
  -- FIXME: this plugin is not configured full. Spend sometime to fix it
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  dependencies = {
    {
      'chrisgrieser/nvim-lsp-endhints',
      event = 'LspAttach',
      opts = {}, -- required, even if empty
    },
  },
}
