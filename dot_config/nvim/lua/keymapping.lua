-- To avoid (`vim` is not defined) erorr in every line when using LSP.
local vim = vim

--- Set keymap
-- @param[opts={silent = true, noremap = true}]
local function map(mode, keys, action, opts)
	vim.keymap.set(mode, keys, action, opts or { silent = true, noremap = true })
end

------------ General KeyMapping -------------

-- Clear search results
map("n", "//", ":noh<CR>")
-- Go to previous buffer
-- TODO: Map another better key.
map("n", "<F12>", "<cmd>e#<CR>")
-- Tabs and windows mappings
map("n", "tt", ":tabnew<CR>")

------------ Plugins KeyMapping -------------

-- lspconfig
map("n", "<leader>D", vim.lsp.buf.declaration)
map("n", "<leader>d", vim.lsp.buf.definition)
map("n", "<leader>m", vim.lsp.buf.hover)
map("n", "<leader>r", vim.lsp.buf.references)
map("n", "<leader>s", vim.lsp.buf.signature_help)
map("n", "<leader>i", vim.lsp.buf.implementation)
map("n", "<leader>t", vim.lsp.buf.type_definition)
map("n", "<leader>gw", vim.lsp.buf.document_symbol)
map("n", "<leader>gW", vim.lsp.buf.workspace_symbol)
map("n", "<leader>a", vim.lsp.buf.code_action)
map("n", "<leader>ee", vim.diagnostic.open_float)
map("n", "<leader>n", vim.lsp.buf.rename)
map("n", "<leader>=", vim.lsp.buf.formatting)
map("n", "<leader>ai", vim.lsp.buf.incoming_calls)
map("n", "<leader>ao", vim.lsp.buf.outgoing_calls)

-- bufferline.nvim
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>")
map("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>")

-- nvim-tree.lua
map("n", "<F3>", "<cmd>NvimTreeToggle<cr>")

-- trouble
map("n", "<F5>", "<cmd>TroubleToggle document_diagnostics<cr>")
-- TODO: Conseder deleting key map
map("n", "<F6>", "<cmd>TroubleToggle loclist<cr>")

-- todo-comments.nvim
map("n", "<F7>", "<cmd>TroubleToggle todo<cr>")

-- yanky.nvim
map("n", "p", "<Plug>(YankyPutAfter)")
map("n", "P", "<Plug>(YankyPutBefore)")
map("n", "gp", "<Plug>(YankyGPutAfter)")
map("n", "gP", "<Plug>(YankyGPutBefore)")
map("n", "<c-n>", "<Plug>(YankyCycleForward)")
map("n", "<c-n>", "<plug>(yankycyclebackward)")

-- nvim-surround
map("n", "<F4>", "<cmd>SymbolsOutline<cr>")

-- telescope.nvim
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- For yanky.nvim
map("n", "<c-h>", "<cmd>Telescope yank_history<cr>")
-- TODO: Add more keymaps for telescope

-- hop.nvim
map("n", "<leader>f", function()
	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
end)
map("n", "<leader>F", function()
	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
end)
map("n", "<leader>t", function()
	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 })
end)
map("n", "<leader>T", function()
	require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 })
end)
map("n", "<leader>k", function()
	require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR })
end)
map("n", "<leader>j", function()
	require("hop").hint_lines_skip_whitespace({ direction = require("hop.hint").HintDirection.AFTER_CURSOR })
end)
map("n", "<leader>w", function()
	require("hop").hint_words({ current_line_only = true })
end)

-- TODO: Create keymapping for crates.nvim to be loaded only in Cargo.toml file
