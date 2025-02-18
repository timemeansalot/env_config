-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = 'g++ build debug',
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand '%:p'
    local fileBasenameNoExtension = vim.fn.fnamemodify(file, ':t:r')
    return {
      cmd = { 'g++' },
      args = { '-g', file, '-o', fileBasenameNoExtension },
      components = { { 'on_output_quickfix', open = true }, 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp' },
  },
}
