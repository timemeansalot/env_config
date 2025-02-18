return {
  {
    'stevearc/overseer.nvim',
    opts = {},
    config = function()
      require('overseer').setup {
        templates = { 'builtin', 'user.cpp_build_debug', 'user.cpp_build_release', 'user.run_script' },
      }
      vim.api.nvim_create_user_command('WatchRun', function()
        local overseer = require 'overseer'
        overseer.run_template({ name = 'run script' }, function(task)
          if task then
            task:add_component { 'restart_on_save', paths = { vim.fn.expand '%:p' } }
            local main_win = vim.api.nvim_get_current_win()
            overseer.run_action(task, 'open hsplit')
            vim.api.nvim_set_current_win(main_win)
          else
            vim.notify('WatchRun not supported for filetype ' .. vim.bo.filetype, vim.log.levels.ERROR)
          end
        end)
      end, {})
    end,
  },
}
