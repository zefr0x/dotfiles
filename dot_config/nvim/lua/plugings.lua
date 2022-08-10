return require('packer').startup(function(use)
    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    -- Standalone UI for nvim-lsp progress
    use 'j-hui/fidget.nvim'

    -- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
    use 'mfussenegger/nvim-lint'

    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'
    -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-nvim-lsp'
    -- Snippets source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'
    -- Autopairs for () and {} etc...
    use 'windwp/nvim-autopairs'
    -- vscode-like pictograms for neovim lsp completion items
    use 'onsails/lspkind.nvim'

    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'

    -- Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
    use { 'folke/trouble.nvim', requires={ 'kyazdani42/nvim-web-devicons' } }
    -- Find, Filter, Preview, Pick. All lua, all the time
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    -- telescope-fzf-native.nvim: FZF sorter for telescope written in c
    -- https://github.com/BurntSushi/ripgrep is required also.
    use {
        'nvim-telescope/telescope.nvim',
        branch='0.1.x',
        requires={
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run='make' },
            'kyazdani42/nvim-web-devicons'
        }
    }
    -- Comments todo list
    -- https://github.com/BurntSushi/ripgrep is required also.
    use { 'folke/todo-comments.nvim', requires={ { 'nvim-lua/plenary.nvim' } } }

    -- Nvim Treesitter configurations and abstraction layer
    use {
        'nvim-treesitter/nvim-treesitter',
        run=function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }
    -- Rainbow parentheses for neovim using tree-sitter
    use 'p00f/nvim-ts-rainbow'
    -- Highlight arguments' definitions and usages, using Treesitter
    use 'm-demare/hlargs.nvim'
    -- Wisely add 'end' in Vimscript, Lua, etc...
    use 'RRethy/nvim-treesitter-endwise'
    -- Use treesitter to auto close and auto rename html tag
    use 'windwp/nvim-ts-autotag'
    -- Determines the text object you meant based on your location in the syntax tree
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- Paint colors text in for #000000 or rgb(0,0,0) or ... with the real colors
    use 'norcalli/nvim-colorizer.lua'
    -- vim-polyglot Highlight matching html tags
    -- TODO: Replace
    use 'valloric/MatchTagAlways'
    -- indent guides for neovim
    use 'lukas-reineke/indent-blankline.nvim'

    -- easy motion
    -- TODO: Replace
    use 'easymotion/vim-easymotion'
    -- Surround
    use 'kylechui/nvim-surround'
    -- Comment code easily
    use 'numToStr/Comment.nvim'

    -- Better file browser
    use { 'kyazdani42/nvim-tree.lua', requires={ 'kyazdani42/nvim-web-devicons' } }
    -- Class/module browser
    use 'simrat39/symbols-outline.nvim'
    -- Visual git plugin for Neovim
    use { 'tanvirtin/vgit.nvim' }

    -- Lualine
    use { 'nvim-lualine/lualine.nvim', after = "github-nvim-theme", requires={ 'kyazdani42/nvim-web-devicons' } }

    -- Colors themes
    use 'projekt0n/github-nvim-theme'

    -- Improved Yank and Put functionalities for Neovim
    use 'gbprod/yanky.nvim'
    -- Auto save fiels to disk
    use 'Pocco81/auto-save.nvim'

    --  TODO: Create a plugin for hybrid line number.

    -- Tools for better development in (rust) using neovim's builtin LSP
    -- rust-analyzer is required
    use 'simrat39/rust-tools.nvim'
end)

