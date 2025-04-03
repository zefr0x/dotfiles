-- nvim-navic
local navic = require("nvim-navic")

-- lualine.nvim
require("lualine").setup({
	options = {
		theme = "zer0",
		-- globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { statusline = { "Trouble", "undotree", "diff" } },
	},
	extensions = {
		"symbols-outline",
		-- { sections = { lualine_a = {  } }, filetypes = { "diff" } },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return str:sub(1, 1)
				end,
			},
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				newfile_status = true,
				path = 1,
				symbols = {
					modified = " ",
					readonly = " ",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
				separator = "",
			},
			{
				function()
					return navic.get_location({
						-- FIX: Make the depth dynamic and trucate it from the right
						depth_limit = 1,
						separator = "  ",
						format_text = function(text)
							return text
						end,
					})
				end,
				cond = navic.is_available,
				separator = "",
			},
			{
				-- TODO: Use the new `lsp_status` component when it supports hiding after finishing.
				function()
					return require("lsp-progress").progress()
				end,
			},
		},
		lualine_x = {
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

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = "lualine_augroup",
	pattern = "LspProgressStatusUpdated",
	callback = require("lualine").refresh,
})
