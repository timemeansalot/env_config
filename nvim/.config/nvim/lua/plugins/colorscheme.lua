local tokyonight = {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function()
    vim.cmd([[colorscheme tokyonight]]) -- use vim.cmd api to use this colorscheme
  end,
}

local gruvbox = {
  "ellisonleao/gruvbox.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  config = function()
    vim.cmd([[colorscheme gruvbox]]) -- use vim.cmd api to use this colorscheme
  end,
}

local catppuccin = {
  "catppuccin/nvim",
  lazy = false, -- do not lazy load this colorscheme scheme, or vim can not find it!
  name = "catppuccin",
  opts = {
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  config = function()
    -- vim.cmd([[colorscheme catppuccin-latte]]) -- use vim.cmd api to use this colorscheme
    vim.cmd([[colorscheme catppuccin-mocha]]) -- use vim.cmd api to use this colorscheme
  end,
}
-- return gruvbox
return catppuccin
-- return tokyonight
