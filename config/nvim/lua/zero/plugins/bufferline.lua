vim.opt.termguicolors = true
require("bufferline").setup({})

vim.keymap.set("n", "<A-]>", "<Cmd>BufferLineMoveNext<CR>")
vim.keymap.set("n", "<A-[>", "<Cmd>BufferLineMovePrev<CR>")
vim.keymap.set("n", "<A-,>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<A-.>", "<Cmd>BufferLineCyclePrev<CR>")
