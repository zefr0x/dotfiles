-- yanky.nvim
require("yanky").setup({
	ring = {
		storage = "memory",
		ignore_registers = { "_", "+", "*" },
	},
	system_clipboard = {
		sync_with_ring = false,
	},
	textobj = {
		enabled = true,
	},
})
