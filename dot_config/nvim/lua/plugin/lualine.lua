-- nvim-navic
local navic = require("nvim-navic")

-- lualine.nvim
require("lualine").setup({
	options = {
		theme = "zer0",
		-- globalstatus = true,
		component_separators = {
			left = "", --[[ right = "" ]]
		},
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = { "Trouble", "undotree", "diff" } },
	},
	extensions = {
		"nvim-tree",
		"symbols-outline",
		-- { sections = { lualine_a = {  } }, filetypes = { "diff" } },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				newfile_status = true,
				path = 1,
				symbols = {
					modified = "",
					readonly = "",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
			},
			{ navic.get_location, cond = navic.is_available },
			{
				"lsp_progress",
				display_components = { "spinner" },
				-- timer = { spinner = 1000 },
				spinner_symbols = {
					"(●   )",
					"( ●  )",
					"(  ● )",
					"(   ●)",
					"(  ● )",
					"( ●  )",
					"(●   )",
				},
			},
		},
		lualine_x = {
			"filesize",
			{ "fileformat", separator = "" },
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = {
			"location", --[[ "searchcount" ]]
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
})
