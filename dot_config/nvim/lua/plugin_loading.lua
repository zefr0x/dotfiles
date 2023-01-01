local vim = vim

-- TODO: Go back to packer.nvim after the lockfile is implemented.
-- https://github.com/wbthomason/packer.nvim/issues/1009

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
	vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
	-- Collection of configurations for built-in LSP client
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/nvim-cmp", "SmiteshP/nvim-navic", "simrat39/rust-tools.nvim" },
		config = function()
			require("plugin.lsp")
		end,
	},

	-- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("plugin.lint")
		end,
	},

	-- Autocompletion plugin
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
            -- Autopairs for () and {} etc...
			{
                "windwp/nvim-autopairs",
                config = function()
			        require("plugin.auto_pair")
		        end,
            },
            -- Snippets plugin
			"L3MON4D3/LuaSnip",
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
		config = function()
			require("plugin.completion")
		end,
	},

	-- TODO: Configure debug adapter protocol client for neovim
	-- use "mfussenegger/nvim-dap"

	-- Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.trouble_diagnostics")
		end,
	},
	-- Find, Filter, Preview, Pick. All lua, all the time
	-- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
	-- telescope-fzf-native.nvim: FZF sorter for telescope written in c
	-- https://github.com/BurntSushi/ripgrep is required also.
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"gbprod/yanky.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugin.telescope")
		end,
	},
	-- Comments todo list
	-- https://github.com/BurntSushi/ripgrep is required also.
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.todo_comments")
		end,
	},

	-- Nvim Treesitter configurations and abstraction layer
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugin.treesitter")
		end,
	},
	-- Rainbow parentheses for neovim using tree-sitter
	{
		"p00f/nvim-ts-rainbow",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	-- Highlight arguments' definitions and usages, using Treesitter
	{
		"m-demare/hlargs.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugin.hlargs")
		end,
	},
	-- Wisely add 'end' in Vimscript, Lua, etc...
	{
		"RRethy/nvim-treesitter-endwise",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	-- Use treesitter to auto close and auto rename html tag
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugin.ts_autotag")
		end,
	},
	-- Determines the text object you meant based on your location in the syntax tree
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	-- Paint colors text in for #000000 or rgb(0,0,0) or ... with the real colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugin.colorizer")
		end,
	},
	-- vim-polyglot Highlight matching html tags
	-- TODO: Find plugin like this one
	-- use "valloric/MatchTagAlways"
	-- indent guides for neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugin.indent_blankline")
		end,
	},

	-- Speed and easy motions.
	{
		"phaazon/hop.nvim",
		branch = "v2",
		config = function()
			require("plugin.hop_motions")
		end,
	},
	-- Surround
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugin.surround")
		end,
	},
	-- Comment code easily
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugin.comment")
		end,
	},

	-- Better file browser
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.file_browser")
		end,
	},
	-- Class/module browser
	{
		"simrat39/symbols-outline.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugin.symbols_outline")
		end,
	},

	-- Visual git plugin for Neovim
	{
		"tanvirtin/vgit.nvim",
		config = function()
			require("plugin.vgit")
		end,
	},
	-- TODO: Configure testing framework
	-- use "nvim-neotest/neotest"

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
            "nvim-tree/nvim-web-devicons",
            -- LSP Progress lualine componenet
            "arkav/lualine-lsp-progress",
            -- Simple winbar/statusline plugin that shows your current code context
            "SmiteshP/nvim-navic",
        },
		config = function()
			require("plugin.lualine")
		end,
	},
	--  A snazzy bufferline/tabline
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugin.bufferline")
		end,
	},

	-- Improved Yank and Put functionalities for Neovim
	{
		"gbprod/yanky.nvim",
		config = function()
			require("plugin.yanky")
		end,
	},
	-- The undo history visualizer for Vim
    -- TODO: Find a lua alternative.
	{
		"mbbill/undotree",
		config = function()
			require("plugin.undotree")
		end,
	},
	-- Auto save fiels to disk
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("plugin.auto_save")
		end,
	},
	-- Intelligently reopen files at your last edit position in Vim
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("plugin.lastplace")
		end,
	},
	-- Smooth scrolling neovim plugin written in lua
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("plugin.neoscroll")
		end,
	},

	--  TODO: Create a plugin for hybrid line number.

	-- Help managing crates.io dependencies
	{
		"saecki/crates.nvim",
		event = "BufReadPost Cargo.toml",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.crates_config")
		end,
	},
}, {
	install = {
		missing = false,
	},
	checker = {
		enabled = false,
	},
})
