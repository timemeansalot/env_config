local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason") -- define all the language server that we have
require("user.lsp.handlers").setup() -- define some functions we use after setting LSP
require("user.lsp.null-ls") -- formatting the whole document
