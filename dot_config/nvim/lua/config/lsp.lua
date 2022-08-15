-- nvim-lspconfig
local lspconfig = require('lspconfig')


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- nvim-navic
local custom_on_attach = function (client, bufnr)
    -- FIXME: Doesn't work with some languages.
    require("nvim-navic").attach(client, bufnr)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "rust_analyzer", "jedi_language_server", "texlab", "tsserver", "html" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

-- lua-language-server
require'lspconfig'.sumneko_lua.setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
    settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- For html and cssls. They only provides completions when snippet support is enabled
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- vscode-css-languageserver
require'lspconfig'.cssls.setup{
    on_attach = custom_on_attach,
    capabilities = capabilities,
    cmd={ "vscode-css-languageserver", "--stdio" }
    }

-- vscode-html-languageserver
require'lspconfig'.html.setup{
    on_attach = custom_on_attach,
    capabilities = capabilities,
    filetypes = { "html", "htmldjango" },
    cmd = { "vscode-html-languageserver", "--stdio" }
    }

-- fidget.nvim ------------------------------
require("fidget").setup {}

