return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      filetype = {
        python = "python3 -u",
        go = "go run",
        rust = {
          -- "cargo run --bin",
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt",
        },
        -- TODO: add C config here
        -- c = function(...)
        --   c_base = {
        --     "cd $dir &&",
        --     "gcc $fileName -o",
        --     "/tmp/$fileNameWithoutExt",
        --   }
        --   local c_exec = {
        --     "&& /tmp/$fileNameWithoutExt &&",
        --     "rm /tmp/$fileNameWithoutExt",
        --   }
        --   vim.ui.input({ prompt = "Add more args:" }, function(input)
        --     c_base[4] = input
        --     vim.print(vim.tbl_extend("force", c_base, c_exec))
        --     require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
        --   end)
        -- end,
      },
    })
  end,

  keys = {
    { "<leader>r", "<cmd>RunCode<CR>", desc = "RunCode" },
    { "<leader>rf", "<cmd>RunFile<CR>", desc = "RunFile" },
    { "<leader>rp", "<cmd>RunProject<CR>", desc = "RunProject" },
    { "<leader>rc", "<cmd>RunClose<CR>", desc = "RunClose" },
  },
}
