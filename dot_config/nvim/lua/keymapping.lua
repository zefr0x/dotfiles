--- Set keymap
-- @param[opts={silent = true, noremap = true}]
local function map(mode, keys, action, opts)
	vim.keymap.set(mode, keys, action, opts or { silent = true, noremap = true })
end

------------ General KeyMapping -------------

-- Clear search results
map("n", "//", vim.cmd.noh)

-- Go to previous buffer
-- TODO: Map another better key.
map("n", "<F12>", function()
	vim.cmd.e("#")
end)

-- Move highlited lines up and down.
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Move up and down the file while keeping the curser in it's place.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep curser in search in the middle.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Copy to system clipbaord
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Open URI
-- FIXME: Find a way to write it better in Lua.
map("n", "gx", "<Cmd>! handlr open <cfile><CR>")

------------ Plugins KeyMapping -------------

-- lspconfig
map("n", "<leader>D", vim.lsp.buf.declaration)
map("n", "<leader>d", vim.lsp.buf.definition)
map("n", "<leader>m", vim.lsp.buf.hover)
map("n", "<leader>r", vim.lsp.buf.references)
map("n", "<leader>s", vim.lsp.buf.signature_help)
map("n", "<leader>i", vim.lsp.buf.implementation)
map("n", "<leader>gt", vim.lsp.buf.type_definition)
map("n", "<leader>gw", vim.lsp.buf.document_symbol)
map("n", "<leader>gW", vim.lsp.buf.workspace_symbol)
map("n", "<leader>a", vim.lsp.buf.code_action)
map("n", "<leader>ee", vim.diagnostic.open_float)
map("n", "<leader>n", vim.lsp.buf.rename)
map("n", "<leader>=", vim.lsp.buf.formatting)
map("n", "<leader>ai", vim.lsp.buf.incoming_calls)
map("n", "<leader>ao", vim.lsp.buf.outgoing_calls)

-- bufferline.nvim
map("n", "<leader>bp", vim.cmd.BufferLinePick)
map("n", "<leader>bc", vim.cmd.BufferLinePickClose)

-- nvim-tree.lua
map("n", "<F3>", vim.cmd.NvimTreeToggle)

-- trouble
map("n", "<F5>", "<cmd>TroubleToggle document_diagnostics<cr>")

-- todo-comments.nvim
map("n", "<F6>", "<cmd>TroubleToggle todo<cr>")

-- yanky.nvim
map("n", "p", "<Plug>(YankyPutAfter)")
map("n", "P", "<Plug>(YankyPutBefore)")
map("n", "gp", "<Plug>(YankyGPutAfter)")
map("n", "gP", "<Plug>(YankyGPutBefore)")
map("n", "]p", "<Plug>(PutIndentAfter)")
map("n", "[p", "<Plug>(PutIndentBefore)")
map("n", "<c-n>", "<Plug>(YankyCycleForward)")
map("n", "<c-p>", "<plug>(YankyCycleBackward)")
-- Past from system clipboard
map("n", "<leader>p", '"+<Plug>(YankyPutAfter)')
map("n", "<leader>P", '"+<Plug>(YankyPutBefore)')

-- nvim-surround
map("n", "<F4>", vim.cmd.SymbolsOutline)

-- telescope.nvim
map("n", "<leader>zf", function()
	vim.cmd.Telescope("find_files")
end)
map("n", "<leader>zg", function()
	vim.cmd.Telescope("live_grep")
end)
map("n", "<leader>zb", function()
	vim.cmd.Telescope("buffers")
end)
map("n", "<leader>zh", function()
	vim.cmd.Telescope("help_tags")
end)
-- For yanky.nvim
map("n", "<c-h>", function()
	vim.cmd.Telescope("yank_history")
end)
-- TODO: Add more keymaps for telescope

-- hop.nvim
map("n", "<leader>f", function()
	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
end)
map("n", "<leader>F", function()
	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
end)
-- FIXME: Conflict with <leader>td
-- map("n", "<leader>t", function()
-- 	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 })
-- end)
--
-- map("n", "<leader>T", function()
-- 	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 })
-- end)
map("n", "<leader>k", function()
	require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
end)
map("n", "<leader>j", function()
	require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
end)
map("n", "<leader>w", function()
	require("hop").hint_words({ current_line_only = true })
end)

-- undotree
map("n", "<F2>", vim.cmd.UndotreeToggle)

------------ gitsigns.nvim
-- Navigation
map("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		vim.cmd.Gitsigns("next_hunk")
		return "<Ignore>"
	end)
end, { expr = true })
map("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		vim.cmd.Gitsigns("prev_hunk")
	end)
	return "<Ignore>"
end, { expr = true })
-- Actions
map({ "n", "v" }, "<leader>hs", function()
	vim.cmd.Gitsigns("stage_hunk")
end)
map("n", "<leader>hS", function()
	vim.cmd.Gitsigns("stage_buffer")
end)
map("n", "<leader>hu", function()
	vim.cmd.Gitsigns("undo_stage_hunk")
end)
map({ "n", "v" }, "<leader>hr", function()
	vim.cmd.Gitsigns("reset_hunk")
end)
map("n", "<leader>hp", function()
	vim.cmd.Gitsigns("preview_hunk")
end)
map("n", "<leader>hb", function()
	vim.cmd.Gitsigns("blame_line")
end)
map("n", "<leader>dt", function()
	vim.cmd.Gitsigns("diffthis")
end)
map("n", "<leader>dT", function()
	vim.cmd.Gitsigns("diffthis ~")
end)
map("n", "<leader>td", function()
	vim.cmd.Gitsigns("toggle_deleted")
end)
-- Text object
map("n", "<leader>sh", function()
	vim.cmd.Gitsigns("select_hunk")
end)
