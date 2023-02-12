-- nvim-colorizer.lua -----------------------
require("colorizer").setup({
	filetypes = {
		"*",
		-- html = { mode = 'foreground'; },
	},
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		AARRGGBB = false,
		names = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,

		mode = "background",
		tailwind = false,
		sass = { enable = false, parsers = { css } },
	},
})
