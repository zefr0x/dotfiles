local o = vim.opt
local g = vim.g

--------------- Base configs ----------------

-- set GUI options
vim.api.nvim_set_option("guifont", "JetBrainsMono Nerd Font:h16")

-- Set encoding
o.encoding = "utf-8"

-- Set listchars
o.list = true
o.listchars:append("trail:⋅")

-- Tabs and spaces handling
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- Line numbering
o.nu = true

-- When scrolling, keep cursor 3 lines away from screen border
o.scrolloff = 3

-- Fix cursor being jittery when using live gutter enabled or linting a file
o.signcolumn = "yes"

-- Config colors
o.termguicolors = true
o.background = "dark"

--  Disable autocompletion preview window
o.completeopt:remove("preview")
-- autocompletion of files and commands behaves like shell
-- (complete only the common part, list the options that match)
o.wildmode = "list:longest"

-- Set a shell
o.shell = "/bin/bash"

-- Set leader key
g.mapleader = ","
