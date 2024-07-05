-- lsp-progress.nvim

require("lsp-progress").setup({
	spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
	spin_update_time = 1000,
	client_format = function(client_name, spinner, series_messages)
		return #series_messages > 0 and (client_name .. " " .. spinner) or nil
	end,
	format = function(client_messages)
		if #client_messages > 0 then
			return table.concat(client_messages, " ")
		else
			return ""
		end
	end,
})
