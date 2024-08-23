-- nvim-ts-autotag
require("nvim-ts-autotag").setup({})

-- Fix closing a tag causes built-in LSP to update diagnostics incorrectly
-- https://github.com/windwp/nvim-ts-autotag/issues/19
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		min = "Warning",
	},
	update_in_insert = true,
})
