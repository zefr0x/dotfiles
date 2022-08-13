-- bufferline.nvim
require("bufferline").setup {
    options = {
        always_show_bufferline = false,
        numbers = "ordinal",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        separator_style = "slant",
    }
}

