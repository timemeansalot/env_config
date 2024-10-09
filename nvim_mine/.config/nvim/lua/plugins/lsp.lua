return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for server configuration guide
    config = function()
      local lspconfig = require("lspconfig")
      local base = require("lspconfig.configs")
      local util = require("lspconfig/util")

      local on_attach = base.on_attach
      -- local capabilities = base.capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- lsp for lua
      lspconfig["lua_ls"].setup({}) -- use default setup for lua_ls
      -- lsp for c++/c
      lspconfig.clangd.setup {
        -- on_attach = function(client, bufnr)
        --   client.server_capabilities.signatureHelpProvider = false
        --   on_attach(client, bufnr)
        -- end,
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
      require("lspconfig").rust_analyzer.setup {
        -- filetypes = "rust",
        capabilities = capabilities,
        -- settings = {
        --   ['rust-analyzer'] = {
        --     diagnostics = {
        --       enable = false,
        --     }
        --   }
        -- }
      }
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
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        highlight = { enable = true, },
        indent = { enable = true },
        ensure_installed = {
          "lua",
          "cpp",
          "go",
          "rust",
          -- install below, or you can not use`:h xx` to read help document.
          "vim",
          "vimdoc",
          "luadoc",
          "markdown",
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- lsp
        "lua_ls",
        "gopls",
        "clangd", -- c++/c
      },
    },
  },
  {
    "williamboman/mason.nvim", -- used to install debuger, code analyzer and formatter for programming language
    opts = {
      ensure_installed = {
        -- server
        -- "clangd",        -- c++/c
        -- "gopls",         -- golang
        "rust-analyzer", -- rust
        -- formatter
        "clang-format",
        -- DAP
        "codelldb", -- debug c++, rust
        "delve",    -- debug golang
      },
    },
    config = function()
      local mason = require("mason")
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  }
}
