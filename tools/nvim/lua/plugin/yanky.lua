-- yanky.nvim
require("yanky").setup({
	ring = {
		storage = "memory",
	},
	system_clipboard = {
		sync_with_ring = false,
	},
	textobj = {
		enabled = true,
	},
})
