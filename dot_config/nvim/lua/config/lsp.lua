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

-- rust-tools.nvim
require('rust-tools').setup {
    server = {
        on_attach = custom_on_attach,
        capabilities = capabilities,
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    overrideCommand = {
                        "cargo", "clippy", "--workspace", "--message-format=json", "--all-targets", "--all-features"
                    }
                }
            }
        }
    }
}

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "jedi_language_server", "texlab", "tsserver", "html" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

-- lua-language-server
lspconfig.sumneko_lua.setup {
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
lspconfig.cssls.setup{
    on_attach = custom_on_attach,
    capabilities = capabilities,
    cmd={ "vscode-css-languageserver", "--stdio" }
    }

-- vscode-html-languageserver
lspconfig.html.setup{
    on_attach = custom_on_attach,
    capabilities = capabilities,
    filetypes = { "html", "htmldjango" },
    cmd = { "vscode-html-languageserver", "--stdio" }
    }

-- fidget.nvim ------------------------------
require("fidget").setup {}


-- Set icons for diagnostics in the gutter.
local signs = {
    Error = " ",
    Warning = " ",
    Hint = " ",
    Information = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

