-- Bootstrapping packer.nvim
local ensure_packer = function()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Profiling Vim and Neovim startup time
	-- use("dstein64/vim-startuptime")

	-- Collection of configurations for built-in LSP client
	use({
		"neovim/nvim-lspconfig",
		ft = {
			"rust",
			"c",
			"cpp",
			"python",
			"tex",
			"javascript",
			"typescript",
			"yaml",
			"java",
			"lua",
			"css",
			"html",
			"json",
		},
		config = function()
			require("plugin.lsp")
		end,
	})
	-- LSP source for nvim-cmp
	use({
		"hrsh7th/cmp-nvim-lsp",
		module = "cmp_nvim_lsp",
	})
	-- Tools for better development in rust using neovim's builtin lsp
	use({
		"simrat39/rust-tools.nvim",
		module = "rust-tools",
	})
	-- Simple winbar/statusline plugin that shows your current code context
	use({
		"SmiteshP/nvim-navic",
		module = "nvim-navic",
	})

	-- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
	use({
		"mfussenegger/nvim-lint",
		ft = { "c", "cpp", "python", "tex", "lua", "javascript", "typescript", "html", "css" },
		config = function()
			require("plugin.lint")
		end,
	})

	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugin.completion")
		end,
	})
	-- Autopairs for () and {} etc...
	use({
		"windwp/nvim-autopairs",
		module = "nvim-autopairs",
		config = function()
			require("plugin.auto_pair")
		end,
	})
	-- Snippets source for nvim-cmp
	use({
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
	})
	use({
		-- Snippets plugin
		"L3MON4D3/LuaSnip",
		module = "luasnip",
	})
	use({
		"rafamadriz/friendly-snippets",
		after = "LuaSnip",
	})
	-- cmp-nvim-lsp-signature-help
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
		after = "nvim-cmp",
	})
	-- nvim-cmp source for textDocument/documentSymbol via nvim-lsp
	use({
		"hrsh7th/cmp-nvim-lsp-document-symbol",
		after = "nvim-cmp",
	})
	-- nvim-cmp source for path
	use({
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	})
	-- nvim-cmp source for vim's cmdline
	use({
		"hrsh7th/cmp-cmdline",
		after = "nvim-cmp",
	})
	-- nvim-cmp source for buffer words
	use({
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	})
	-- Add latex symbol support for nvim-cmp
	-- "kdheepak/cmp-latex-symbols",

	-- TODO: Configure debug adapter protocol client for neovim
	-- use "mfussenegger/nvim-dap"

	-- Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	use({
		"folke/trouble.nvim",
		event = "CmdUndefined TroubleToggle",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.trouble_diagnostics")
		end,
	})
	-- Find, Filter, Preview, Pick. All lua, all the time
	-- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
	-- telescope-fzf-native.nvim: FZF sorter for telescope written in c
	-- https://github.com/BurntSushi/ripgrep is required also.
	use({
		"nvim-telescope/telescope.nvim",
		event = "CmdUndefined Telescope",
		branch = "0.1.x",
		requires = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				module = "telescope._extensions.fzf",
				run = "make",
			},
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugin.telescope")
		end,
	})
	-- Comments todo list
	-- https://github.com/BurntSushi/ripgrep is required also.
	use({
		"folke/todo-comments.nvim",
		event = "BufEnter",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.todo_comments")
		end,
	})

	-- Nvim Treesitter configurations and abstraction layer
	use({
		"nvim-treesitter/nvim-treesitter",
		ft = {
			"rust",
			"python",
			"c",
			"cpp",
			"javascript",
			"html",
			"htmldjango",
			"css",
			"scss",
			"lua",
			"bash",
			"fish",
			"cmake",
			"dockerfile",
			"latex",
			"markdown",
			"regex",
			"sql",
			"json",
			"toml",
			"yaml",
			"git_rebase",
			"gitignore",
			"gitattributes",
			"diff",
			"comment",
			"mermaid",
			"java",
		},
		module = "nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugin.treesitter")
		end,
	})
	-- Rainbow parentheses for neovim using tree-sitter
	use({
		"https://git.sr.ht/~p00f/nvim-ts-rainbow",
		after = "nvim-treesitter",
	})
	-- Highlight arguments' definitions and usages, using Treesitter
	use({
		"m-demare/hlargs.nvim",
		after = "nvim-treesitter",
		config = function()
			require("plugin.hlargs")
		end,
	})
	-- Determines the text object you meant based on your location in the syntax tree
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})
	-- Use treesitter to auto close and auto rename html tag
	use({
		"windwp/nvim-ts-autotag",
		event = "InsertEnter *.html",
		after = "nvim-treesitter",
		config = function()
			require("plugin.ts_autotag")
		end,
	})
	-- Paint colors text in for #000000 or rgb(0,0,0) or ... with the real colors
	use({
		"NvChad/nvim-colorizer.lua",
		ft = { "css", "scss", "lua" },
		config = function()
			require("plugin.colorizer")
		end,
	})
	-- vim-polyglot Highlight matching html tags
	-- TODO: Find plugin like this one
	-- use "valloric/MatchTagAlways"

	-- indent guides for neovim
	use({
		"lukas-reineke/indent-blankline.nvim",
		after = "nvim-treesitter",
		config = function()
			require("plugin.indent_blankline")
		end,
	})

	-- Speed and easy motions.
	use({
		"phaazon/hop.nvim",
		module = "hop",
		branch = "v2",
		config = function()
			require("plugin.hop_motions")
		end,
	})
	-- Surround
	use({
		"kylechui/nvim-surround",
		event = "BufEnter",
		config = function()
			require("plugin.surround")
		end,
	})
	-- Comment code easily
	use({
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = function()
			require("plugin.comment")
		end,
	})

	-- Better file browser
	use({
		"kyazdani42/nvim-tree.lua",
		event = "CmdUndefined NvimTreeToggle",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.file_browser")
		end,
	})
	-- Class/module browser
	use({
		"simrat39/symbols-outline.nvim",
		event = "CmdUndefined SymbolsOutline",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugin.symbols_outline")
		end,
	})

	-- Git integration for buffers
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = function()
			require("plugin.gitsigns")
		end,
	})
	-- TODO: Configure testing framework
	-- use "nvim-neotest/neotest"

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		requires = {
			"nvim-tree/nvim-web-devicons",
			-- LSP Progress lualine componenet
			"arkav/lualine-lsp-progress",
		},
		config = function()
			require("plugin.lualine")
		end,
	})
	--  A snazzy bufferline/tabline
	use({
		"akinsho/bufferline.nvim",
		event = "BufEnter",
		tag = "v3.*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugin.bufferline")
		end,
	})

	-- Improved Yank and Put functionalities for Neovim
	use({
		"gbprod/yanky.nvim",
		event = "BufEnter",
		config = function()
			require("plugin.yanky")
		end,
	})
	-- The undo history visualizer for Vim
	-- TODO: Find a lua alternative.
	use({
		"mbbill/undotree",
		event = "BufEnter",
		config = function()
			require("plugin.undotree")
		end,
	})
	-- Auto save fiels to disk
	use({
		"Pocco81/auto-save.nvim",
		event = { "BufReadPost", "BufWritePost" },
		config = function()
			require("plugin.auto_save")
		end,
	})
	-- Intelligently reopen files at your last edit position in Vim
	use({
		"ethanholz/nvim-lastplace",
		event = "BufReadPre",
		config = function()
			require("plugin.lastplace")
		end,
	})
	-- Smooth scrolling neovim plugin written in lua
	use({
		"karb94/neoscroll.nvim",
		event = { "CursorMoved", "CursorMovedI" },
		config = function()
			require("plugin.neoscroll")
		end,
	})

	-- Automatically set up configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
