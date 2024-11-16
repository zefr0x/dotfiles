-- Bootstrapping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Collection of configurations for built-in LSP client
	{
		"neovim/nvim-lspconfig",
		ft = {
			"rust",
			"c",
			"go",
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
	},

	-- An asynchronous linter plugin for Neovim complementary to the built-in Language Server Protocol support
	{
		"mfussenegger/nvim-lint",
		ft = { "c", "cpp", "python", "tex", "lua", "javascript", "typescript", "html", "css" },
		config = function()
			require("plugin.lint")
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- LSP source for nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
			-- cmp-nvim-lsp-signature-help
			"hrsh7th/cmp-nvim-lsp-signature-help",
			-- nvim-cmp source for textDocument/documentSymbol via nvim-lsp
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			-- cmp-source for clipboard history from yanky.nvim
			"chrisgrieser/cmp_yanky",
			-- nvim-cmp source for path
			"hrsh7th/cmp-path",
			-- nvim-cmp source for vim's cmdline
			"hrsh7th/cmp-cmdline",
			-- nvim-cmp source for ripgrep
			-- https://github.com/BurntSushi/ripgrep is required.
			"lukas-reineke/cmp-rg",
			-- Add latex symbol support for nvim-cmp
			-- "kdheepak/cmp-latex-symbols",
			-- Snippets source for nvim-cmp
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					-- Snippets plugin
					{
						"L3MON4D3/LuaSnip",
						dependencies = { "rafamadriz/friendly-snippets" },
					},
				},
			},
		},
		config = function()
			require("plugin.completion")
		end,
	},

	--  Help managing dependencies in Cargo.toml files
	{
		"saecki/crates.nvim",
		event = "BufReadPost Cargo.toml",
		version = "v0.5.*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.crates")
		end,
	},

	-- TODO: Configure debug adapter protocol client for neovim
	-- "mfussenegger/nvim-dap",

	-- Pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.trouble_diagnostics")
		end,
	},
	-- Find, Filter, Preview, Pick. All lua, all the time
	-- https://github.com/BurntSushi/ripgrep is required.
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		branch = "0.1.x",
		dependencies = {
			-- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
			"nvim-lua/plenary.nvim",
			-- telescope-fzf-native.nvim: FZF sorter for telescope written in c
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugin.telescope")
		end,
	},
	-- Comments todo list
	-- https://github.com/BurntSushi/ripgrep is required.
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.todo_comments")
		end,
	},

	-- Nvim Treesitter configurations and abstraction layer
	{
		"nvim-treesitter/nvim-treesitter",
		ft = {
			"rust",
			"python",
			"c",
			"go",
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
			"tex",
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
			"kotlin",
			"hyprlang",
			"meson",
			"just",
			"po",
			"xml",
			"kdl",
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		dependencies = {
			-- Determines the text object you meant based on your location in the syntax tree
			"nvim-treesitter/nvim-treesitter-textobjects",
			-- Setting the commentstring based on the cursor location in a file
			"JoosepAlviste/nvim-ts-context-commentstring",
			-- Rainbow parentheses for neovim using tree-sitter
			{
				"hiphish/rainbow-delimiters.nvim",
				config = function()
					require("plugin.rainbow_delimiters")
				end,
			},
			-- Highlight arguments' definitions and usages, using Treesitter
			{
				-- TODO: Delete when most LSPs do support semantic tokens.
				"m-demare/hlargs.nvim",
				config = function()
					require("plugin.hlargs")
				end,
			},
			-- Autopairs for () and {} etc...
			{
				"windwp/nvim-autopairs",
				config = function()
					require("plugin.auto_pair")
				end,
			},
			-- Use treesitter to auto close and auto rename tags
			{
				"windwp/nvim-ts-autotag",
				-- TODO: Only load it for supported files.
				-- HTML files may have diffrent file types.
				config = function()
					require("plugin.ts_autotag")
				end,
			},
			-- indent guides for neovim
			{
				"lukas-reineke/indent-blankline.nvim",
				config = function()
					require("plugin.indent_blankline")
				end,
			},
		},
		config = function()
			require("plugin.treesitter")
		end,
	},
	-- Paint colors text in for #000000 or rgb(0,0,0) or ... with the real colors
	{
		"NvChad/nvim-colorizer.lua",
		ft = { "css", "scss", "lua" },
		config = function()
			require("plugin.colorizer")
		end,
	},
	-- vim-polyglot Highlight matching html tags
	-- TODO: Find plugin like this one
	-- {
	-- 	"valloric/MatchTagAlways",
	-- 	event = "InsertEnter *.html",
	-- },

	-- Speed and easy motions.
	{
		"smoka7/hop.nvim",
		-- PERF: Load based on key bindings.
		-- keys = {}
		event = "BufEnter",
		version = "v2.*",
		config = function()
			require("plugin.hop_motions")
		end,
	},
	-- Surround
	{
		"kylechui/nvim-surround",
		event = "BufEnter",
		config = function()
			require("plugin.surround")
		end,
	},
	-- Comment code easily
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		config = function()
			require("plugin.comment")
		end,
	},

	-- Git integration for buffers
	{
		"lewis6991/gitsigns.nvim",
		-- PERF: Load only when inside git repo.
		event = "BufEnter",
		config = function()
			require("plugin.gitsigns")
		end,
	},
	-- TODO: Configure testing framework
	-- "nvim-neotest/neotest",

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			-- LSP Progress lualine componenet
			{
				"linrongbin16/lsp-progress.nvim",
				config = function()
					require("plugin.lsp_progress")
				end,
			},
			-- Simple winbar/statusline plugin that shows your current code context
			{
				"SmiteshP/nvim-navic",
				config = function()
					require("plugin.navic")
				end,
			},
		},
		config = function()
			require("plugin.lualine")
		end,
	},
	--  A snazzy bufferline/tabline
	{
		"akinsho/bufferline.nvim",
		event = "BufEnter",
		version = "v4.*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugin.bufferline")
		end,
	},

	-- Improved Yank and Put functionalities for Neovim
	{
		"gbprod/yanky.nvim",
		event = "BufEnter",
		config = function()
			require("plugin.yanky")
		end,
	},
	-- The undo history visualizer for Vim
	-- TODO: Find a lua alternative.
	{
		"mbbill/undotree",
		event = "BufEnter",
		config = function()
			require("plugin.undotree")
		end,
	},
	-- Auto save fiels to disk
	{
		"Pocco81/auto-save.nvim",
		event = { "BufReadPost", "BufWritePost" },
		config = function()
			require("plugin.auto_save")
		end,
	},
	-- Intelligently reopen files at your last edit position in Vim
	{
		-- VULN: Project is archived since 27/7/2023.
		"ethanholz/nvim-lastplace",
		event = "BufReadPre",
		config = function()
			require("plugin.lastplace")
		end,
	},
	-- Smooth scrolling neovim plugin written in lua
	{
		"karb94/neoscroll.nvim",
		event = { "CursorMoved", "CursorMovedI" },
		config = function()
			require("plugin.neoscroll")
		end,
	},
}, {
	lockfile = vim.fn.expand("~/.dotfiles/tools/nvim/lazy-lock.json"),
	rocks = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"spellfile",
				"health",
				"rplugin",
			},
		},
	},
})
