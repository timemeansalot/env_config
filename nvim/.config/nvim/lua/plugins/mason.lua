return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "lua_ls",
        "pyright",
        "gopls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- bash, shell
        "shfmt",
        -- lua related tools
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "lua-language-server",
        -- python related tools
        "pyright", -- python lsp
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "debugpy",
        "mypy",
        "ruff-lsp",
        -- golang related tools
        "gopls", -- go lsp
        "go-debug-adapter", -- go dap
        "goimports",
        "gofumpt",
        -- rust
        "rust-analyzer", -- rust lsp
        "codelldb",
      },
    })
  end,
}
