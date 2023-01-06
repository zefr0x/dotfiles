-- nvim-tree.lua
require("nvim-tree").setup({
	-- sort_by = "name",
	renderer = {
		special_files = { "Cargo.toml", "README.md", "readme.md" },
	},
	filters = {
		custom = { "^.git$", "^.env$" },
	},
})
