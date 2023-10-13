-- nvim-lspconfig
local lspconfig = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- nvim-navic
local custom_on_attach = function(client, bufnr)
	-- FIXME: Doesn't work with some languages.
	require("nvim-navic").attach(client, bufnr)

	require("lsp-inlayhints").on_attach(client, bufnr)
end

-- To appropriately highlight codefences returned from denols.
vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
	"clangd",
	"texlab",
	"denols",
	"yamlls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = custom_on_attach,
		capabilities = capabilities,
	})
end

-- eclipse.jdt.ls
lspconfig.jdtls.setup({
	on_attach = custom_on_attach,
	capabilities = capabilities,
	settings = {
		java = {
			autobuild = {
				enabled = false,
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
	settings = {
		pylsp = {
			plugins = {
				flake8 = { enabled = true },
				pydocstyle = { enabled = true },
				pycodestyle = { enabled = false },
				mccabe = { enabled = false },
				pyflakes = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },
			},
		},
	},
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

-- For html, cssls, jsonls and emmet_ls. They only provides completions when snippet support is enabled
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

-- emmet-ls
lspconfig.emmet_ls.setup({
	-- on_attach = custom_on_attach,
	capabilities = capabilities,
	filetypes = { "html", "htmldjango", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

-- Set icons for diagnostics in the gutter.
for type, icon in pairs({
	Error = " ",
	Warning = " ",
	Hint = "󰌶 ",
	Information = " ",
}) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {
		text = icon,
		texthl = hl,
		-- numhl = hl,
	})
end
