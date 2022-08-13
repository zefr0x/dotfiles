--- Set keymap
-- @param[opts={silent = true, noremap = true}]
local function map(mode, keys, action, opts)
    vim.api.nvim_set_keymap (mode, keys, action,
        opts or {silent = true, noremap = true}
    )
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
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>s", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>t", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ee", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>")
map("n", "<leader>n", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
map("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")


-- bufferline.nvim
map("n", "<leader>bp", "<cmd>BufferLinePick<cr>")
map("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>")

-- nvim-tree.lua
map("n", "<F3>", "<cmd>:NvimTreeToggle<cr>")


-- trouble
map("n", "<F5>", "<cmd>:TroubleToggle document_diagnostics<cr>")
-- TODO: Conseder deleting key map
map("n", "<F6>", "<cmd>:TroubleToggle loclist<cr>")

-- todo-comments.nvim
map("n", "<F7>", "<cmd>:TodoTrouble<cr>")



-- yanky.nvim
map("n", "p", "<Plug>(YankyPutAfter)")
map("n", "P", "<Plug>(YankyPutBefore)")
map("n", "gp", "<Plug>(YankyGPutAfter)")
map("n", "gP", "<Plug>(YankyGPutBefore)")
map("n", "<c-n>", "<Plug>(YankyCycleForward)")
map("n", "<c-n>", "<plug>(yankycyclebackward)")

-- nvim-surround
map("n", "<F4>", "<cmd>:SymbolsOutline<cr>")

-- telescope.nvim
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
-- For yanky.nvim
map("n", "<c-h>", "<cmd>Telescope yank_history<cr>")
-- TODO: Add more keymaps for telescope


-- hop.nvim
map("n", "<leader>f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>")
map("n", "<leader>F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>")
map("n", "<leader>t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_offset = -1 })<cr>")
map("n", "<leader>T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, hint_offset = 1 })<cr>")

