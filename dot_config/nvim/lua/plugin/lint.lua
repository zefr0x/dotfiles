-- nvim-lint
require("lint").linters_by_ft = {
	cpp = { "clangtidy", "flawfinder" },
	python = { "mypy", "bandit" },
	tex = { "chktex" },
	lua = { "selene" },
	html = { "tidy" },
	css = { "stylelint" },
}

-- Run linters on read and write
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
