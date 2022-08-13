-- nvim-treesitter
require('nvim-treesitter.configs').setup  {
    ensure_installed = {
        "rust",
        "python",
        "c",
        "cpp",
        "javascript",
        "html",
        "css",
        "lua",
        "cmake",
        "dockerfile",
        "latex",
        "markdown",
        "regex",
        "sql",
        "toml"
    },
    highlight = {
        enable = true,
        },
    autotag = { -- nvim-ts-autotag
        enable = true,
        },
    rainbow = { -- nvim-ts-rainbow
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    endwise = { -- nvim-treesitter-endwise
        enable = true,
    },
}

