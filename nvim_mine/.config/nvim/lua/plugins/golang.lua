return {
  {
    "olexsmir/gopher.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    config = function()
      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "gotests",
          impl = "impl",
          iferr = "iferr",
          dlv = "dlv",
        },
        gotests = {
          -- gotests doesn't have template named "default" so this plugin uses "default" to set the default template
          template = "default",
          -- path to a directory containing custom test code templates
          template_dir = nil,
          -- switch table tests from using slice to map (with test name for the key)
          -- works only with gotests installed from develop branch
          named = false,
        },
        gotag = {
          transform = "snakecase",
        },
      }
    end,
    -- config = function(_, opts)
    --   require("gopher").setup(opts)
    --   -- require("core.utils").load_mappings("gopher")
    -- end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
    keys = {
      { "<leader>gsj", "<cmd>GoTagAdd json<cr>", desc = "add json struct tags" },
      { "<leader>gsy", "<cmd>GoTagAdd yaml<cr>", desc = "add yaml struct tags" },
    }
  },
}
