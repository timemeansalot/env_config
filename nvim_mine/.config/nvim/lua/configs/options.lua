-- depread warnings for something I don't care at all
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = "/opt/homebrew/bin/python3" -- TODO: only work for MacOS

-- number
vim.opt.number = true
vim.opt.relativenumber = true

-- tab width
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true  -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- clipboard
vim.opt.clipboard:append("unnamedplus")

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.opt.swapfile = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- stop continue comment
vim.api.nvim_create_autocmd("BufEnter",
  { callback = function() vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" } end, })

-- always draw the sign column, useful for plugin like lspsaga
vim.opt.signcolumn = "yes"
