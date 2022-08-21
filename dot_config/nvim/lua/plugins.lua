return require("packer").startup(function(use)
    -- Collection of configurations for built-in LSP client
    use {
        "neovim/nvim-lspconfig",
        after = { "nvim-cmp", "nvim-navic" },
        config = function ()
            require("config.lsp")
        end
    }
    -- Standalone UI for nvim-lsp progress
    use "j-hui/fidget.nvim"

    -- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
    use {
        "mfussenegger/nvim-lint",
        config = function ()
            require("config.lint")
        end
    }

    -- Snippets plugin
    use { "L3MON4D3/LuaSnip" }

    -- Autocompletion plugin
    use {
        "hrsh7th/nvim-cmp",
        after = { "LuaSnip", "nvim-autopairs", "lspkind.nvim" },
        requires = {
            -- LSP source for nvim-cmp
            "hrsh7th/cmp-nvim-lsp",
            -- nvim-cmp source for path
            "hrsh7th/cmp-path",
            -- Snippets source for nvim-cmp
            "saadparwaiz1/cmp_luasnip",
            -- cmp-nvim-lsp-signature-help
            "hrsh7th/cmp-nvim-lsp-signature-help",
            -- nvim-cmp source for textDocument/documentSymbol via nvim-lsp
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            -- Add latex symbol support for nvim-cmp
            "kdheepak/cmp-latex-symbols",
            -- nvim-cmp source for vim's cmdline
            "hrsh7th/cmp-cmdline",
            -- nvim-cmp source for buffer words
            "hrsh7th/cmp-buffer",
        },
        config = function ()
            require("config.completion")
        end
    }
    -- Autopairs for () and {} etc...
    use "windwp/nvim-autopairs"
    -- vscode-like pictograms for neovim lsp completion items
    use "onsails/lspkind.nvim"

    -- TODO: Configure debug adapter protocol client for neovim
    -- use "mfussenegger/nvim-dap"

    -- Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
    use {
        "folke/trouble.nvim",
        requires={ "kyazdani42/nvim-web-devicons" },
        config = function ()
            require("config.trouble_diagnostics")
        end
    }
    -- Find, Filter, Preview, Pick. All lua, all the time
    -- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
    -- telescope-fzf-native.nvim: FZF sorter for telescope written in c
    -- https://github.com/BurntSushi/ripgrep is required also.
    use {
        "nvim-telescope/telescope.nvim",
        branch="0.1.x",
        requires={
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", run="make" },
            "kyazdani42/nvim-web-devicons"
        },
        after = "yanky.nvim",
        config = function()
            require("config.telescope")
        end
    }
    -- Comments todo list
    -- https://github.com/BurntSushi/ripgrep is required also.
    use {
        "folke/todo-comments.nvim",
        requires={ "nvim-lua/plenary.nvim" },
        config = function ()
            require("config.todo_comments")
        end
    }

    -- Nvim Treesitter configurations and abstraction layer
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function ()
            require("config.treesitter")
        end
    }
    -- Rainbow parentheses for neovim using tree-sitter
    use {
        "p00f/nvim-ts-rainbow",
        after = { "nvim-treesitter" }
    }
    -- Highlight arguments' definitions and usages, using Treesitter
    use {
        "m-demare/hlargs.nvim",
        after = { "nvim-treesitter" },
        config = function()
            require("config.hlargs")
        end
    }
    -- Wisely add 'end' in Vimscript, Lua, etc...
    use {
        "RRethy/nvim-treesitter-endwise",
        after = { "nvim-treesitter" },
    }
    -- Use treesitter to auto close and auto rename html tag
    use {
        "windwp/nvim-ts-autotag",
        after = { "nvim-treesitter" },
        config = function ()
            require("config.ts_autotag")
        end
    }
    -- Determines the text object you meant based on your location in the syntax tree
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = { "nvim-treesitter" },
    }
    -- Paint colors text in for #000000 or rgb(0,0,0) or ... with the real colors
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("config.colorizer")
        end
    }
    -- vim-polyglot Highlight matching html tags
    -- TODO: Find plugin like this one
    -- use "valloric/MatchTagAlways"
    -- indent guides for neovim
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            require("config.indent_blankline")
        end
    }

    -- Speed and easy motions.
    use {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function ()
            require("config.hop_motions")
        end
    }
    -- Surround
    use "kylechui/nvim-surround"
    -- Comment code easily
    use {
        "numToStr/Comment.nvim",
        config = function ()
            require("config.comment")
        end
    }

    -- Better file browser
    use {
        "kyazdani42/nvim-tree.lua",
        requires={ "kyazdani42/nvim-web-devicons" },
        config = function()
            require("config.file_browser")
        end
    }
    -- Class/module browser
    use {
        "simrat39/symbols-outline.nvim",
        after = { "nvim-treesitter" },
        config = function ()
            require("config.symbols_outline")
        end
    }
    -- Visual git plugin for Neovim
    use {
        "tanvirtin/vgit.nvim",
        config = function ()
            require("config.vgit")
        end
    }
    -- TODO: Configure testing framework
    -- use "nvim-neotest/neotest"

    -- Colors themes
    use "projekt0n/github-nvim-theme"

    -- Lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires={ "kyazdani42/nvim-web-devicons" },
        config = function ()
            require("config.lualine")
        end
    }
    --  A snazzy bufferline/tabline
    use {
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        config = function ()
            require("config.bufferline")
        end
    }
    -- Simple winbar/statusline plugin that shows your current code context
    use "SmiteshP/nvim-navic"

    -- Improved Yank and Put functionalities for Neovim
    use {
        "gbprod/yanky.nvim",
        config = function()
            require("config.yanky")
        end
    }
    -- Auto save fiels to disk
    use {
        "Pocco81/auto-save.nvim",
        config = function ()
            require("config.auto_save")
        end
    }
    -- Intelligently reopen files at your last edit position in Vim
    use {
        "ethanholz/nvim-lastplace",
        config = function ()
            require("config.lastplace")
        end
    }
    -- Smooth scrolling neovim plugin written in lua
    use {
        "karb94/neoscroll.nvim",
        config = function ()
            require("config.neoscroll")
        end
    }

    --  TODO: Create a plugin for hybrid line number.

    -- Tools for better development in (rust) using neovim's builtin LSP
    -- rust-analyzer is required
    use {
        "simrat39/rust-tools.nvim",
        after = "nvim-lspconfig",
        config = function ()
            require("config.rust_tools_config")
        end
    }
    -- Healp managing crates.io dependencies
    use {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require("config.crates_config")
    end,
}

    -- Load the colors theme
    -- If it was loaded with the plugin it will brake the bufferline colors
    require("config.theme")
end)

