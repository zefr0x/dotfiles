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

o.smartindent = true

-- Line numbering
o.number = true
o.relativenumber = true

-- When scrolling, keep cursor 7 lines away from screen border
o.scrolloff = 3

-- Fix cursor being jittery when using live gutter enabled or linting a file
-- No need for it, I think it has been fixed.
-- o.signcolumn = "yes"

-- Hide the vim mode, since it is shown in the lualine.
o.showmode = false

-- Config colors
o.termguicolors = true

--  Disable autocompletion preview window
o.completeopt:remove("preview")
-- autocompletion of files and commands behaves like shell
-- (complete only the common part, list the options that match)
o.wildmode = "list:longest"

-- Set a shell
o.shell = "/usr/bin/bash"

-- Backup and undo
o.swapfile = false
o.backup = false
o.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
o.undofile = true

-- Set leader key
g.mapleader = ","
