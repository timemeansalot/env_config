vim.g.mapleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "save file" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "no highlight search" })
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy plugin manager panel" })

-- Lspsaga
vim.keymap.set("n", "K", "<cmd>Lspsaga peek_definition<cr>", { desc = "show info" })
vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<cr>", {desc="show info"})
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", {desc="go to definition"})
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", {desc="rename symbol"})
vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<cr>", {desc="rename symbol"})
vim.keymap.set("n", "go", "<cmd>Lspsaga outline<cr>", {desc="outline functions"})
vim.keymap.set("n", "gO", "<cmd>Lspsaga outgoing_calls<cr>", {desc="outling function calls"})
vim.keymap.set("n", "gi", "<cmd>Lspsaga incoming_calls<cr>", {desc="outling function calls"})
vim.keymap.set("n", "fm", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "show info" })
