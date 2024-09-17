return {
  {
    "neovim/nvim-lspconfig",
    -- event = "VeryLazy",
    -- opts = {
    --   diagnostics = {
    --     underline = true,        -- underline code error
    --     update_in_insert = true, -- update diagnos in insert mode
    --     severity_sort = false,   -- do not sort error info by severity
    --     float = {
    --       style = "minimal",
    --       border = "rounded",
    --       source = "always",
    --       header = "",
    --       prefix = "",
    --     },
    --   },
    -- },
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for server configuration guide
    config = function()
      local lspconfig = require("lspconfig")
      local base = require("lspconfig.configs")
      local util = require("lspconfig/util")

      local on_attach = base.on_attach
      local capabilities = base.capabilities
      -- lsp for lua
      lspconfig["lua_ls"].setup({}) -- use default setup for lua_ls
      -- lsp for c++/c
      lspconfig.clangd.setup {
        on_attach = function(client, bufnr)
          client.server_capabilities.signatureHelpProvider = false
          on_attach(client, bufnr)
        end,
        capabilities = capabilities,
      }
      -- lsp for golang
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      }
      -- lsp for rust
      -- lspconfig.rust.setup{}
      require("lspconfig").rust_analyzer.setup{}
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = "TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        ensure_installed = {
          "lua",
          "cpp",
          "go",
          "rust",
        }
      })
    end,
  },
}
