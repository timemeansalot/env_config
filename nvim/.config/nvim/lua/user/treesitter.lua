local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = {"javascript", "c", "lua", "vim", "vimdoc", "verilog", "markdown" },
  sync_install = false,
  auto_install = true,
	highlight = {
		enable = true, -- false will disable the whole extension
		-- disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true},
  additional_vim_regex_highlighting = false,
	-- indent = { enable = true, disable = { "python", "css" } },
})
