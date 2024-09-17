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
  -- {
  --   "leoluz/nvim-dap-go",
  --   config = function()
  --     require('dap-go').setup {
  --       -- Additional dap configurations can be added.
  --       -- dap_configurations accepts a list of tables where each entry
  --       -- represents a dap configuration. For more details do:
  --       -- :help dap-configuration
  --       dap_configurations = {
  --         {
  --           -- Must be "go" or it will be ignored by the plugin
  --           type = "go",
  --           name = "Attach remote",
  --           mode = "remote",
  --           request = "attach",
  --         },
  --       },
  --       -- delve configurations
  --       delve = {
  --         -- the path to the executable dlv which will be used for debugging.
  --         -- by default, this is the "dlv" executable on your PATH.
  --         path = "dlv",
  --         -- time to wait for delve to initialize the debug session.
  --         -- default to 20 seconds
  --         initialize_timeout_sec = 20,
  --         -- a string that defines the port to start delve debugger.
  --         -- default to string "${port}" which instructs nvim-dap
  --         -- to start the process in a random available port.
  --         -- if you set a port in your debug configuration, its value will be
  --         -- assigned dynamically.
  --         port = "${port}",
  --         -- additional args to pass to dlv
  --         args = {},
  --         -- the build flags that are passed to delve.
  --         -- defaults to empty string, but can be used to provide flags
  --         -- such as "-tags=unit" to make sure the test suite is
  --         -- compiled during debugging, for example.
  --         -- passing build flags using args is ineffective, as those are
  --         -- ignored by delve in dap mode.
  --         -- avaliable ui interactive function to prompt for arguments get_arguments
  --         build_flags = {},
  --         -- whether the dlv process to be created detached or not. there is
  --         -- an issue on Windows where this needs to be set to false
  --         -- otherwise the dlv server creation will fail.
  --         -- avaliable ui interactive function to prompt for build flags: get_build_flags
  --         detached = vim.fn.has("win32") == 0,
  --         -- the current working directory to run dlv from, if other than
  --         -- the current working directory.
  --         cwd = nil,
  --       },
  --       -- options related to running closest test
  --       tests = {
  --         -- enables verbosity when running the test.
  --         verbose = false,
  --       },
  --     }
  --   end
  -- },
}
