local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require"esmantovich.lsp.lsp-installer"
require("esmantovich.lsp.handlers").setup()
require "esmantovich.lsp.null-ls"
