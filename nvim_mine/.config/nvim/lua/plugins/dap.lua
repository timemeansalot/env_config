return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        expand_lines = true,
        icons = {
          expanded = "▾",
          current_frame = "",
          collapsed = "▸"
        },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t"
        },
        floating = {
          max_height = nil,  -- These can be integers or a float between 0 and 1.
          max_width = nil,   -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
        }
      })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        dap.repl.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        dap.repl.close()
      end

      -- set ui for debug
      local dap_breakpoint = {
        breakpoint = {
          text = "🛑",
          -- text = "🟥",
          -- text = "●",
          texthl = "LspDiagnosticsSignError",
          linehl = "",
          numhl = "",
        },
        rejected = {
          text = "",
          texthl = "LspDiagnosticsSignHint",
          linehl = "",
          numhl = "",
        },
        stopped = {
          text = "",
          texthl = "LspDiagnosticsSignInformation",
          linehl = "DiagnosticUnderlineInfo",
          numhl = "LspDiagnosticsSignInformation",
        },
      }

      vim.fn.sign_define("DapBreakpoint", dap_breakpoint.breakpoint)
      vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
      vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
    end,
    keys = {
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
    }
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<F5>",   "<cmd>DapContinue<cr>",         desc = "start or continue debug" },
      { "<S-F5>", "<cmd>DapTerminate<cr>",        desc = "stop debug" },
      { "<F6>",   "<cmd>DapStepOver<cr>",         desc = "step over function" },
      { "<F7>",   "<cmd>DapStepInto<cr>",         desc = "step into function" },
      { "<F8>",   "<cmd>DapStepOut<cr>",          desc = "step out function" },
      { "<F9>",   "<cmd>DapToggleBreakpoint<cr>", desc = "create a new break point" },
    },
    config = function()
      -- -- setup dap config by VsCode launch.json file
      -- local vscode = require("dap.ext.vscode")
      -- local json = require("plenary.json")
      -- vscode.json_decode = function(str)
      --   return vim.json.decode(json.json_strip_comments(str))
      -- end
      --
      -- -- Extends dap.configurations with entries read from .vscode/launch.json
      -- if vim.fn.filereadable(".vscode/launch.json") then
      --   vscode.load_launchjs()
      -- end

      local dap = require("dap")
      require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "c", "cpp", "rust" }})
      -- config debug server for c++/c
      dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
          -- CHANGE THIS to your path!
          command = "/Users/fujie/.local/share/nvim/mason/bin/codelldb/", -- TODO: Config on MacOS
          args = { "--port", "${port}" },
        }
      }
      -- config debug server for golang
      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = 'dlv',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
          -- add this if on windows, otherwise server won't open successfully
          -- detached = false
        }
      }

      -- config debug for c++
      dap.configurations.cpp = {
        {
          name = "debug c++ or c",
          type = "codelldb",
          request = "launch",
          program = function()
            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', "${workspaceRoot}/${file}")
            -- return "${fileBasename}"
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      -- config debug for rust
      dap.configurations.rust = {
        {
          name = "Launch Debug Rust",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      -- config debug for go
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}"
        },
        {
          type = "delve",
          name = "Debug test", -- configuration for debugging test files
          request = "launch",
          mode = "test",
          program = "${file}"
        },
        -- works with go.mod packages and sub packages
        {
          type = "delve",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}"
        }
      }
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,                     -- enable this plugin (the default)
        enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = true,    -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,            -- show stop reason when stopped for exceptions
        commented = false,                  -- prefix virtual text with comment string
        -- experimental features:
        virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      })
    end
  }
}
