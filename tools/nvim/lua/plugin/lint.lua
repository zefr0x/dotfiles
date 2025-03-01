-- nvim-lint
require("lint").linters_by_ft = {
	-- TODO: This should be done by LSP and pre-commit.
	cpp = { "clangtidy", "flawfinder" },
	-- TODO: Remove this after ruff's Red Knot.
	python = { "mypy" },
}

-- Run linters on read and write
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
