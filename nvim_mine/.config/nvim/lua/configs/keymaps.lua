vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "save file" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "no highlight search" })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy plugin manager panel" })

-- Lspsaga
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "show info" })
-- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", {desc="show info"}) -- TODO: change this back
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "show info" })
vim.keymap.set("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "show info" })
