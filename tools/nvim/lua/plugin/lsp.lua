-- nvim-lspconfig
local lspconfig = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local custom_on_attach = function(client, bufnr)
	-- nvim-navic
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end

	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

-- To appropriately highlight codefences returned from denols.
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
	"clangd",
	"ruff",
	"tinymist",
	"denols",
	"yamlls",
	"harper_ls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = custom_on_attach,
		capabilities = capabilities,
	})
end

-- TexLab
lspconfig.texlab.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	settings = {
		texlab = {
			chktex = {
				onOpenAndSave = true,
			},
		},
	},
})

-- rust analyzer
lspconfig.rust_analyzer.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				overrideCommand = {
					"cargo",
					"clippy",
					"--workspace",
					"--message-format=json",
					"--all-targets",
					"--all-features",
				},
			},
		},
	},
})

-- pylsp
lspconfig.pylsp.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

-- lua-language-server
lspconfig.lua_ls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- For html, cssls and jsonls. They only provides completions when snippet support is enabled
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- vscode-css-languageserver
lspconfig.cssls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	cmd = { "vscode-css-languageserver", "--stdio" },
})

-- vscode-html-languageserver
lspconfig.html.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = { "html", "htmldjango" },
	cmd = { "vscode-html-languageserver", "--stdio" },
})

-- vscode-json-languageserver
lspconfig.jsonls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = {
		current_line = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarning",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInformation",
		},
		numhl = {},
	},
})
