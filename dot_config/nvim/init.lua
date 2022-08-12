--------------- Base configs ----------------


-- Set encoding
vim.opt.encoding = "utf-8"

-- Set listchars
vim.opt.list = true
vim.opt.listchars:append "trail:⋅"

-- Tabs and spaces handling
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Line numbering
vim.opt.nu = true

-- When scrolling, keep cursor 3 lines away from screen border
vim.opt.scrolloff = 3

-- Fix cursor being jittery when using live gutter enabled or linting a file
vim.opt.signcolumn = "yes"

-- Config colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

--  Disable autocompletion preview window
vim.opt.completeopt:remove("preview")
-- autocompletion of files and commands behaves like shell
-- (complete only the common part, list the options that match)
vim.opt.wildmode = "list:longest"

-- Set a shell
vim.opt.shell = "/bin/bash"

-- Set leader key
vim.g.mapleader = ","

-- Clear search results
vim.api.nvim_set_keymap("n", "//", ":noh<CR>",
  {silent = true, noremap = true}
)

-- Open previous buffer
-- TODO: Map another better key.
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>e#<CR>",
  {silent = true, noremap = true}
)

-- Tabs and windows mappings
vim.api.nvim_set_keymap("n", "tt", ":tabnew<CR>",
  {silent = true, noremap = true}
)

--------- Plugins setup and config ----------

-- Load plugins
require('plugings')


-- github-nvim-theme -------------------------------
require('github-theme').setup {
    theme_style = "dark_default",
    dark_float = true,
}

-- nvim-lspconfig ---------------------------
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- nvim-navic
local custom_on_attach = function (client, bufnr)
    -- FIXME: Doesn't work with some languages.
    require("nvim-navic").attach(client, bufnr)
end

local lspconfig = require('lspconfig')

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

-- keymapping
vim.api.nvim_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>ee", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
  {silent = true, noremap = true}
)

-- cmp-luasnip ------------------------------
local luasnip = require('luasnip')

-- lspkind.nvim -----------------------------
local lspkind = require('lspkind')

-- nvim-autopairs ---------------------------
require("nvim-autopairs").setup {}
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

-- nvim-cmp ---------------------------------
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'

cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text', -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
            return vim_item
        end
        })
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        {
            name = "path",
            options = {
                trailing_slash = true,
            }
        },
        { name = "nvim_lsp_signature_help" },
        -- { name = "buffer" }, # TODO: What is this?
        { name = "latex_symbols" },
    },
}

require'cmp'.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' }
    }
})

require'cmp'.setup.cmdline('/', {
    sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' }
    }, {
        { name = 'buffer' }
    })
})

-- fidget.nvim ------------------------------
require("fidget").setup()

-- lualine.nvim -----------------------------
local navic = require("nvim-navic")

require('lualine').setup {
    options = {
        theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename', { navic.get_location, cond = navic.is_available } },
        lualine_x = {
            'filesize',
            { 'fileformat', separator = "" },
            'encoding',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    -- TODO: Configure it in neovim 8.0
    -- winbar = {
    --     lualine_a = {},
    --     lualine_b = {},
    --     lualine_c = {},
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {}
    -- },
}

-- bufferline.nvim --------------------------
require("bufferline").setup {
    options = {
        always_show_bufferline = false,
        numbers = "ordinal",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        separator_style = "slant",
    }
}

vim.api.nvim_set_keymap("n", "<leader>bp", "<cmd>BufferLinePick<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>",
  {silent = true, noremap = true}
)

-- nvim-tree.lua ----------------------------
require("nvim-tree").setup({

})

vim.api.nvim_set_keymap("n", "<F3>", "<cmd>:NvimTreeToggle<cr>",
  {silent = true, noremap = true}
)

-- nvim-colorizer.lua -----------------------
require'colorizer'.setup(
    nil,
    {
        RGB=true;
        RRGGBB=true;
        names=true;
        RRGGBBAA=true;
        rgb_fn=true;
        hsl_fn=true;
        css=true;
        css_fn=true;
    }
)

-- auto-save.nvim ---------------------------
require("auto-save").setup {}

-- Comment.nvim -----------------------------
require('Comment').setup()

-- hop.nvim ---------------------------------
-- require'hop'.setup()
-- vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>:HopWord<CR>",
--  {silent = true, noremap = true}
-- )

-- trouble ----------------------------------
require("trouble").setup {}
vim.api.nvim_set_keymap("n", "<F5>", "<cmd>:TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>:TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)

-- nvim-treesitter --------------------------
require('nvim-treesitter.configs').setup  {
    ensure_installed = {
        "rust",
        "python",
        "c",
        "cpp",
        "javascript",
        "html",
        "css",
        "lua",
        "cmake",
        "dockerfile",
        "latex",
        "markdown",
        "regex",
        "sql",
        "toml"
    },
    highlight = {
        enable = true,
        },
    autotag = { -- nvim-ts-autotag
        enable = true,
        },
    rainbow = { -- nvim-ts-rainbow
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    endwise = { -- nvim-treesitter-endwise
        enable = true,
    },
}


-- nvim-ts-autotag --------------------------

-- Fix closing a tag causes built-in LSP to update diagnostics incorrectly
-- https://github.com/windwp/nvim-ts-autotag/issues/19
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)

-- hlargs.nvim ------------------------------
require('hlargs').setup()

-- rust-tools.nvim --------------------------
require('rust-tools').setup {}

-- indent-blankline.nvim --------------------
require("indent_blankline").setup {
    space_char_blankline = " ",
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    -- show_end_of_line = true,
}

-- todo-comments.nvim -----------------------
require("todo-comments").setup {
    keywords = {
        FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "VULN" },
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
}

vim.api.nvim_set_keymap("n", "<F7>", "<cmd>:TodoTrouble<cr>",
  {silent = true, noremap = true}
)

-- nvim-lint ---------------------------------
require('lint').linters_by_ft = {
    cpp = { "clangtidy", "flawfinder" },
    python = { "mypy", "flake8", "pydocstyle" },
    tex = { "chktex" },
    lua = { "selene" },
    javascript = { "eslint" },
    html = { "tidy" },
    htmldjango = { "tidy" },
    css = { "stylelint" },
}

-- Run linters on read and write
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- yanky.nvim ---------------------------------
require("yanky").setup {}


vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gp", "<Plug>(YankyGPutAfter)",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gP", "<Plug>(YankyGPutBefore)",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap("n", "<c-n>", "<Plug>(YankyCycleForward)",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<c-n>", "<plug>(yankycyclebackward)",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<c-h>", "<cmd>Telescope yank_history<cr>",
  {silent = true, noremap = true}
)

-- nvim-surround ----------------------------
vim.api.nvim_set_keymap("n", "<F4>", "<cmd>:SymbolsOutline<cr>",
  {silent = true, noremap = true}
)

-- vgit.nvim --------------------------------
require('vgit').setup()

-- telescope.nvim ---------------------------
require('telescope').load_extension('fzf')
require("telescope").load_extension("yank_history")


vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",
  {silent = true, noremap = true}
)
-- T#ODO: Add more keymaps for telescope

-- neoscroll.nvim ---------------------------
require('neoscroll').setup {}

-- nvim-lastplace ---------------------------
require'nvim-lastplace'.setup {}

-- hop.nvim
require("hop").setup {}

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_offset = -1 })<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, hint_offset = 1 })<cr>",
  {silent = true, noremap = true}
)

