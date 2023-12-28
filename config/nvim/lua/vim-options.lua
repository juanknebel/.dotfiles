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
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Navigate vim panes
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
