local o = vim.opt
local g = vim.g

--------------- Base configs ----------------

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

-- Mouse
o.mouse = ""

-- Line numbering
o.number = true
o.relativenumber = true

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		o.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		o.relativenumber = true
	end,
})

-- When scrolling, keep cursor 7 lines away from screen border
o.scrolloff = 3

-- Fix cursor being jittery when using live gutter enabled or linting a file
-- No need for it, I think it has been fixed.
-- o.signcolumn = "yes"

-- Hide the vim mode, since it is shown in the lualine.
o.showmode = false

--  Disable autocompletion preview window
o.completeopt:remove("preview")
-- autocompletion of files and commands behaves like shell
-- (complete only the common part, list the options that match)
o.wildmode = "list:longest"

-- Set a shell
o.shell = "/usr/bin/dash"

-- Backup and undo
o.swapfile = false
o.backup = false
o.undodir = os.getenv("XDG_CACHE_HOME") .. "/nvim/undodir"
o.undofile = true

-- System Clipboard Backend
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

-- Set leader key
g.mapleader = ","
