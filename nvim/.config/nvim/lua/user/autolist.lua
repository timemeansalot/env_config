-- local status_ok, autolist= pcall(require, "autolist")
-- if not status_ok then
-- 	return
-- end
--
-- autolist.setup()
-- autolist.create_mapping_hook("i", "<leader><cr>", autolist.new)

local status_ok, autolist = pcall(require, "autolist")
if not status_ok then
	return print("call autolist fail\n")
end

autolist.setup()
-- autolist.create_mapping_hook("i", "<CR>", autolist.new)
-- autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
-- autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")


-- very 卡，卡的很
-- autolist.create_mapping_hook("i", "<leader><CR>", autolist.new)
-- autolist.create_mapping_hook("i", "<leader><Tab>", autolist.indent)
-- autolist.create_mapping_hook("i", "<leader><S-Tab>", autolist.indent, "<C-D>")
autolist.create_mapping_hook("n", "o", autolist.new)
autolist.create_mapping_hook("n", "O", autolist.new_before)
-- autolist.create_mapping_hook("n", ">>", autolist.indent)
-- autolist.create_mapping_hook("n", "<<", autolist.indent)
autolist.create_mapping_hook("n", "<leader>r", autolist.force_recalculate)
autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
vim.api.nvim_create_autocmd("TextChanged", {
	pattern = "-",
	callback = function()
		vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
	end,
})
-- return {
-- 	"gaoDean/autolist.nvim",
-- 	ft = {
-- 		"markdown",
-- 		"text",
-- 		"tex",
-- 		"plaintex",
-- 	},
-- 	config = function()
-- 		local autolist = require("autolist")
-- 	end,
-- }
