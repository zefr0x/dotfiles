-- todo-comments.nvim
require("todo-comments").setup({
	keywords = {
		FIX = {
			icon = " ",
			color = "#d22222",
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "VULN" },
		},
		TODO = { icon = " ", color = "#34d058" },
		HACK = { icon = " ", color = "#ff8c00" },
		WARN = { icon = " ", color = "#ff8c00", alt = { "WARNING", "XXX" } },
		PERF = { icon = "󰅒 ", color = "#d22222", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
		NOTE = { icon = "󱇗 ", color = "#f0e68c", alt = { "INFO" } },
	},
	highlight = {
		multiline = false,
	},
})
