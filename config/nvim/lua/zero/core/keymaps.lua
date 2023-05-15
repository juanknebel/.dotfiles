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

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

----------------------
-- Dap Keybinds
----------------------
keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" }) -- toggle a breakpoint
keymap.set("n", "<leader>dus", function()
  local widgets = require("dap.ui.widgets")
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" }) -- Open the debug window

----------------------
-- Rust Keybinds
----------------------
keymap.set("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "Update crates" })

-----------------------
-- Bufferline Keybinds
----------------------
keymap.set("n", "<A-]>", "<Cmd>BufferLineMoveNext<CR>")
keymap.set("n", "<A-[>", "<Cmd>BufferLineMovePrev<CR>")
keymap.set("n", "<A-,>", "<Cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<A-.>", "<Cmd>BufferLineCyclePrev<CR>")

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
