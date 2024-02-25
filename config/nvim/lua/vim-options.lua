-- Use spaces instead of tabs
vim.cmd("set expandtab")
vim.cmd("set shiftround")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Leader key
vim.g.mapleader = " "

-- Line numbers
vim.cmd("set relativenumber")
vim.cmd("set number")

-- Search
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Dont know
--vim.cmd("set backspace 2")
vim.cmd("set showcmd")
--vim.cmd("set laststatus 2")
--vim.cmd("set autowrite")
vim.cmd("set cursorline")
vim.cmd("set autoread")

-- Navigate vim panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>ml", "<C-w>>", { desc = "Resize to right" }) -- resize to right
vim.keymap.set("n", "<leader>mh", "<C-w><", { desc = "Resize to left" }) -- resize to left
vim.keymap.set("n", "<leader>mk", "<C-w>+", { desc = "Resize up" }) -- resize up
vim.keymap.set("n", "<leader>mj", "<C-w>-", { desc = "Resize down" }) -- resize down
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make equal split windows" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split window" }) -- close current split window
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Move to previous buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Move to next buffer" })

-- Navigate
vim.keymap.set("n", "J", "20jzz")
vim.keymap.set("n", "K", "20kzz")

-- Setting fish shell
vim.opt.shell = "fish"

-- Terminal
vim.keymap.set("n", "<C-t>", [[<Cmd>ToggleTerm<CR>]], { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Open another terminal" })
