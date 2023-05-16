-- indent-blankline.nvim
require("indent_blankline").setup({
	char = " ",
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
	},
	context_char = "│",
	use_treesitter = true,
	show_current_context = true,
	show_current_context_start = true,
	-- use_treesitter_scope = true, -- TODO: See if it's better or not.
	show_trailing_blankline_indent = false,
	filetype_exclude = {
		"lspinfo",
		"checkhealth",
		"help",
		"man",
		"Trouble",
		"undotree",
		"",
	},
})
