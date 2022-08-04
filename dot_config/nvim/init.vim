" This config was built on top of Fisa-vim-config

" Fix background in kitty
let &t_ut=''

" ============================================================================
" Vim-plug initialization

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================
call plug#begin("~/.config/nvim/plugged")

" Collection of configurations for built-in LSP client
Plug 'neovim/nvim-lspconfig'
" Autocompletion plugin
Plug 'hrsh7th/nvim-cmp'
" LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippets source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip'
" Autopairs for () and {} etc...
Plug 'windwp/nvim-autopairs'
" Snippets plugin
Plug 'L3MON4D3/LuaSnip'
"Standalone UI for nvim-lsp progress
Plug 'j-hui/fidget.nvim'
" An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
Plug 'mfussenegger/nvim-lint'
" Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
Plug 'folke/trouble.nvim'
" Find, Filter, Preview, Pick. All lua, all the time
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
" FZF sorter for telescope written in c
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
Plug 'nvim-lua/plenary.nvim'
" Comments todo list
Plug 'folke/todo-comments.nvim'


" Tools for better development in (rust) using neovim's builtin LSP
Plug 'simrat39/rust-tools.nvim'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Rainbow parentheses for neovim using tree-sitter
Plug 'p00f/nvim-ts-rainbow'
" Wisely add 'end' in Vimscript, Lua, etc...
Plug 'RRethy/nvim-treesitter-endwise'
" Use treesitter to auto close and auto rename html tag
Plug 'windwp/nvim-ts-autotag'
" Determines the text object you meant based on your location in the syntax tree
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Highlight arguments' definitions and usages, using Treesitter
Plug 'm-demare/hlargs.nvim'

" comment code easily
Plug 'numToStr/Comment.nvim'
" Lualine
Plug 'nvim-lualine/lualine.nvim'
" vscode-like pictograms for neovim lsp completion items
Plug 'onsails/lspkind.nvim'
" Paint colors text in for #000000 or rgb(0,0,0) or ... with the real color
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
" Surround
Plug 'kylechui/nvim-surround'

" Better file browser
Plug 'kyazdani42/nvim-tree.lua'
" Class/module browser
Plug 'simrat39/symbols-outline.nvim'
" Nice icons in the file explorer and file type status line.
Plug 'kyazdani42/nvim-web-devicons'
" Visual git plugin for Neovim
Plug 'tanvirtin/vgit.nvim'
" Improved Yank and Put functionalities for Neovim
Plug 'gbprod/yanky.nvim'

" auto save fiels to disk
Plug 'Pocco81/auto-save.nvim'
" Colors theme
Plug 'Shatur/neovim-ayu'


" easy motion
Plug 'easymotion/vim-easymotion'
"vim-polyglot Highlight matching html tags
Plug 'valloric/MatchTagAlways'


" TODO: Find alternatives.
" css, html
" Plug 'mattn/emmet-vim'
" javascript
" Plug 'pangloss/vim-javascript'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
" Plug 'myusuf3/numbers.vim'

call plug#end()

" emmit -------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

lua << EOF

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
-- Used for easymotion plugin
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


-- neovim-ayu -------------------------------
require('ayu').colorscheme {}

-- nvim-lspconfig ---------------------------
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'jedi_language_server', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

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
      luasnip.lsp_expand(args.body)
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
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  },
}

-- fidget.nvim ------------------------------
require("fidget").setup()

-- lualine.nvim -----------------------------
require('lualine').setup {
    options = {
        theme = 'ayu',
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filesize', 'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}

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
    python = {"mypy", "flake8", "pydocstyle"}
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
-- TODO: Add move keymaps for telescope

EOF

