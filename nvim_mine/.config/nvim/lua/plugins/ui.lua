return {
  {
    "folke/which-key.nvim",
    dependencies = {
      { "echasnovski/mini.icons" },
      { "nvim-tree/nvim-web-devicons" },
    },
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "rmagatti/auto-session",
    config = function()
      local auto_session = require("auto-session")

      auto_session.setup({
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
      })

      local keymap = vim.keymap
      keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })             -- restore last workspace session for current directory
      keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        numbers = "ordinal",
        show_buffer_close_icons = false,
        color_icons = false,
      },
    },
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>",   desc = "pin buffer" },
      { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",   desc = "go to left hand buffer" },
      { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",   desc = "go toright hand buffer" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "close other buffers" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>",   desc = "close all left buffers" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>",  desc = "close all right buffers" },
      { "<leader>x",  "<cmd>bd<cr>",                    desc = "close current buffers" },
    }
  },
  {
    -- set colorscheme
    "folke/tokyonight.nvim",
    proirity = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = "transparent",
      })
      vim.cmd("colorscheme tokyonight")
    end
  },
}
