return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["python"] = { "black" },
      ["lua"] = { "stylua" },
      ["go"] = { "goimports", "gofumpt" },
      ["rust"] = { "rustfmt" },
    },
  },
}
