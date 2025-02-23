-- nvim-lint
require("lint").linters_by_ft = {
	cpp = { "clangtidy", "flawfinder" },
	python = { "mypy" },
	tex = { "chktex" },
}

-- Run linters on read and write
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
