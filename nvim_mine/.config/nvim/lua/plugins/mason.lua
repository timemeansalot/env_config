return {
  {
    "williamboman/mason.nvim", -- used to install debuger, code analyzer and formatter for programming language
    opts = {
      ensure_installed = {
        -- server
        "clangd", -- c++/c
        "gopls",  -- golang
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
