-- indent-blankline.nvim
require("ibl").setup({
	indent = {
		char = " ",
		tab_char = ">",
	},
	whitespace = {
		highlight = {
			"IndentBlanklineIndent1",
			"IndentBlanklineIndent2",
		},
		remove_blankline_trail = false,
	},
	scope = {
		char = "│",
		highlight = "IndentBlanklineScope",
	},
	exclude = {
		filetypes = {
			"lspinfo",
			"checkhealth",
			"help",
			"man",
			"Trouble",
			"undotree",
			"",
		},
	},
})
