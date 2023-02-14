-- nvim-treesitter
require("nvim-treesitter.configs").setup({
	sync_install = true,
	ensure_installed = {
		"rust",
		"python",
		"c",
		"cpp",
		"javascript",
		"html",
		"css",
		"lua",
		"bash",
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
		"java",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = { -- nvim-ts-autotag
		enable = true,
	},
	rainbow = { -- nvim-ts-rainbow
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
})
