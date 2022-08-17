-- github-nvim-theme
require('github-theme').setup {
    theme_style = "dark_default",
    dark_float = true,
}

-- Fix fidget highliting and use better color
vim.api.nvim_set_hl(0, "FidgetTask", {fg="#58a6ff"})

