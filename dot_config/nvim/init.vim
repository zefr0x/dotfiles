" This config was built on top of Fisa-vim-config

" Fix background in kitty
let &t_ut=''

let using_neovim = has('nvim')

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

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
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin("~/.config/nvim/plugged")

" Now the actual plugins:

" Collection of configurations for built-in LSP client
Plug 'neovim/nvim-lspconfig'
" Autocompletion plugin
Plug 'hrsh7th/nvim-cmp'
" LSP source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippets source for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip'
" Snippets plugin
Plug 'L3MON4D3/LuaSnip'
"Standalone UI for nvim-lsp progress
Plug 'j-hui/fidget.nvim'
" Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
Plug 'folke/trouble.nvim'
" plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
Plug 'nvim-lua/plenary.nvim'
" Comments todo list
Plug 'folke/todo-comments.nvim'


" Tools for better development in (rust) using neovim's builtin LSP
Plug 'simrat39/rust-tools.nvim'

" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" Better file browser
Plug 'kyazdani42/nvim-tree.lua'
" Nice icons in the file explorer and file type status line.
Plug 'kyazdani42/nvim-web-devicons'



" auto save fiels to disk
Plug 'Pocco81/auto-save.nvim'
" easy motion
Plug 'easymotion/vim-easymotion'
" Plug 'phaazon/hop.nvim'
" css, html
Plug 'mattn/emmet-vim'
" javascript
Plug 'pangloss/vim-javascript'

" Class/module browser
Plug 'majutsushi/tagbar'
" Plug 'simrat39/symbols-outline.nvim'
" Search results counter
Plug 'vim-scripts/IndexedSearch'

Plug 'cseelus/vim-colors-lucid'

" Code and files fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
Plug 'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
Plug 'Townk/vim-autoclose'
" Surround
Plug 'tpope/vim-surround'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Better language packs
Plug 'sheerun/vim-polyglot'
" Highlight matching html tags
Plug 'valloric/MatchTagAlways'
" Git integration
Plug 'tpope/vim-fugitive'
" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" Linters
Plug 'neomake/neomake'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Code searcher. If you enable it, you should also configure g:hound_base_url 
" and g:hound_port, pointing to your hound instance
" Plug 'mattn/webapi-vim'
" Plug 'jfo/hound.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" Needed by rust.vim
syntax enable
filetype plugin indent on

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" clear search results
nnoremap <silent> // :noh<CR>

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

" ============================================================================
" Plugins settings and mappings

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>


" Fzf ------------------------------

" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>


" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'


" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227



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
vim.cmd [[ colorscheme lucid ]]

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


--------- Plugins setup and config ----------


-- vim.opt.listchars:append "eol:↴"
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

-- cmp-luasnip ------------------------------
local luasnip = require('luasnip')

-- lspkind.nvim -----------------------------
local lspkind = require('lspkind')

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
        theme = 'iceberg_dark',
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
require'colorizer'.setup(nil, {RGB=true;
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
    ensure_installed = { "rust",
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
                        "toml" }
}

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

-- tagbar ----------------------------------
-- TODO: Replace plugin
-- autofocus on tagbar open
vim.g.tagbar_autofocus = 1

-- Neomake ---------------------------------
-- TODO: Replace plugin
-- Run linters on read and write
vim.fn["neomake#configure#automake"]("rw", 1000)

-- Check python code
vim.g.newmake_python_enabled_makers = {"pyflakes", "pydocstyle", "mypy"}

-- Disable error messages inside the buffer, next to the problematic line
vim.g.neomake_virtualtext_current_error = 0

-- Jedi-vim --------------------------------
-- TODO: Replace plugin

-- Disable jedi-vim autocompletion
vim.g["jedi#completions_enabled"] = 0

-- All these mappings work only for python code:
-- Go to definition
vim.g["jedi#goto_command"] = ",d"
-- Find ocurrences
vim.g["jedi#usages_command"] = ",o"
-- Find assignments
vim.g["jedi#goto_assignments_command"] = ",a"
-- Go to definition in new tab
vim.api.nvim_set_keymap("n", ",D", ":tab split<CR>:call jedi#goto()<CR>",
  {silent = true, noremap = true}
)

-- Yankring ---------------------------------

vim.g.yankring_history_dir = "~/.config/nvim/"
-- Fix for yankring and neovim problem when system has non-text things
-- copied in clipboard
vim.g.yankring_clipboard_monitor = 0

EOF

