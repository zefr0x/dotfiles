-- auto-save.nvim
require("auto-save").setup({
	execution_message = {
		message = function()
			return ("Auto saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
		dim = 0.18,
		cleaning_interval = 1250,
	},
	trigger_events = { "InsertLeave", "TextChanged" },
})
