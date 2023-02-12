-- nvim-colorizer.lua -----------------------
require("colorizer").setup({
	filetypes = {
		"*",
		css = {
			css_fn = true,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
		},
	},
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		AARRGGBB = false,
		names = false,

		mode = "background",
		tailwind = false,
		sass = false,
	},
})
