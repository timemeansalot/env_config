-- local status_ok, autolist= pcall(require, "autolist")
-- if not status_ok then
-- return
-- end
--
-- autolist.setup()
-- autolist.create_mapping_hook("i", "<leader><cr>", autolist.new)

local status_ok, autolist = pcall(require, "autolist")
if not status_ok then
return print("call autolist fail\n")
end

autolist.setup()
vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
-- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
-- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")
-- autolist.create_mapping_hook("i", "<CR>", autolist.new)
-- autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
-- autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")


-- very 卡，卡的很
-- autolist.create_mapping_hook("i", "<leader><CR>", autolist.new)
-- autolist.create_mapping_hook("i", "<leader><Tab>", autolist.indent)
-- autolist.create_mapping_hook("i", "<leader><S-Tab>", autolist.indent, "<C-D>")
-- autolist.create_mapping_hook("n", "o", autolist.new)
-- autolist.create_mapping_hook("n", "O", autolist.new_before)
-- -- autolist.create_mapping_hook("n", ">>", autolist.indent)
-- -- autolist.create_mapping_hook("n", "<<", autolist.indent)
-- autolist.create_mapping_hook("n", "<leader>r", autolist.force_recalculate)
-- autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
-- vim.api.nvim_create_autocmd("TextChanged", {
-- pattern = "-",
-- callback = function()
-- 	vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
-- end,
-- })
