-- nvim-navic
local navic = require("nvim-navic")

-- lualine.nvim
require("lualine").setup({
	options = {
		theme = "zer0",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", { navic.get_location, cond = navic.is_available } },
		lualine_x = {
			"filesize",
			{ "fileformat", separator = "" },
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- TODO: Configure it in neovim 8.0
	-- winbar = {
	--     lualine_a = {},
	--     lualine_b = {},
	--     lualine_c = {},
	--     lualine_x = {},
	--     lualine_y = {},
	--     lualine_z = {}
	-- },
})
