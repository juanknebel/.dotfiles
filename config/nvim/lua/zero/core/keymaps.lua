-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

---------------------
-- Plugin Keybinds
----------------------
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- lsp Keybindings
-- keymap.set("n", "gD", function()
--   vim.lsp.buf.declaration()
-- end, { desc = "LSP declaration" })
-- keymap.set("n", "gd", function()
--   vim.lsp.buf.definition()
-- end, { desc = "LSP declaration" })
-- keymap.set("n", "K", function()
--   vim.lsp.buf.hover()
-- end, { desc = "LSP hover" })
-- keymap.set("n", "gi", function()
--   vim.lsp.buf.implementation()
-- end, { desc = "LSP implementation" })
-- keymap.set("n", "<leader>ls", function()
--   vim.lsp.buf.signature_help()
-- end, { desc = "LSP signature help" })
-- keymap.set("n", "<leader>d", function()
--   vim.lsp.buf.type_definition()
-- end, { desc = "LSP type definition" })
-- keymap.set("n", "<leader>ca", function()
--   vim.lsp.buf.code_action()
-- end, { desc = "LSP code action" })
-- keymap.set("n", "gr", function()
--   vim.lsp.buf.references()
-- end, { desc = "LSP references" })

----------------------
-- BarBar Keybinds
----------------------
-- local bar_bar_opts = { noremap = true, silent = true }
-- -- Move to previous/next
-- keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", bar_bar_opts)
-- keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", bar_bar_opts)
-- -- Re-order to previous/next
-- keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", bar_bar_opts)
-- keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", bar_bar_opts)
-- -- Goto buffer in position...
-- keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", bar_bar_opts)
-- keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", bar_bar_opts)
-- keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", bar_bar_opts)
-- keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", bar_bar_opts)
-- keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", bar_bar_opts)
-- keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", bar_bar_opts)
-- keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", bar_bar_opts)
-- keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", bar_bar_opts)
-- keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", bar_bar_opts)
-- keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", bar_bar_opts)
-- -- Pin/unpin buffer
-- keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", bar_bar_opts)
-- -- Close buffer
-- keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", bar_bar_opts)
-- -- Wipeout buffer
-- --                 :BufferWipeout
-- -- Close commands
-- --                 :BufferCloseAllButCurrent
-- --                 :BufferCloseAllButPinned
-- --                 :BufferCloseAllButCurrentOrPinned
-- --                 :BufferCloseBuffersLeft
-- --                 :BufferCloseBuffersRight
-- -- Magic buffer-picking mode
-- keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", bar_bar_opts)
-- -- Sort automatically by...
-- keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", bar_bar_opts)
-- keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", bar_bar_opts)
-- keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", bar_bar_opts)
-- keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", bar_bar_opts)
--
-- -- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
