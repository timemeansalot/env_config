return {
  'CRAG666/code_runner.nvim',
  opts = {
    filetype = {
      java = {
        'cd $dir &&',
        'javac $fileName &&',
        'java $fileNameWithoutExt',
      },
      python = 'python3 -u',
      go = 'go run',
      typescript = 'deno run',
      rust = {
        'cd $dir &&',
        'rustc $fileName &&',
        '$dir/$fileNameWithoutExt',
      },
      cpp = function()
        local c_base = {
          'cd $dir &&',
          'g++ $fileName -o',
          '/tmp/$fileNameWithoutExt',
        }
        local c_exec = {
          '&& /tmp/$fileNameWithoutExt &&',
          'rm /tmp/$fileNameWithoutExt',
        }
        vim.ui.input({ prompt = 'Add more args:' }, function(input)
          c_base[4] = input
          vim.print(vim.tbl_extend('force', c_base, c_exec))
          require('code_runner.commands').run_from_fn(vim.list_extend(c_base, c_exec))
        end)
      end,
      c = function()
        local c_base = {
          'cd $dir &&',
          'gcc $fileName -o',
          '/tmp/$fileNameWithoutExt',
        }
        local c_exec = {
          '&& /tmp/$fileNameWithoutExt &&',
          'rm /tmp/$fileNameWithoutExt',
        }
        vim.ui.input({ prompt = 'Add more args:' }, function(input)
          c_base[4] = input
          vim.print(vim.tbl_extend('force', c_base, c_exec))
          require('code_runner.commands').run_from_fn(vim.list_extend(c_base, c_exec))
        end)
      end,
    },
  },
  keys = {
    { '<leader>rr', ':RunCode<CR>', desc = '[R]un [C]ode' },
    { '<leader>rf', ':RunFile<CR>', desc = '[R]un [F]ile' },
    { '<leader>rp', ':RunProject<CR>', desc = '[R]un [P]roject' },
    { '<leader>rc', ':RunClose<CR>', desc = '[R]un [C]lose' },
  },
}
