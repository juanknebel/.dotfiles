-- Set the cursorline option to enable a line cursor in insert mode
--vim.cmd([[autocmd InsertEnter * set cursorline]])
--vim.cmd([[autocmd InsertLeave * set nocursorline]])

--vim.o.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
-- Set the cursor shape to a line in insert mode
--vim.cmd([[autocmd InsertLeave * set guicursor=n:ver100]])
--vim.cmd([[autocmd InsertEnter * set guicursor=]])

-- Set the cursor shape to a line in insert mode
vim.cmd([[autocmd InsertEnter * silent! execute "!echo -ne '\e[6 q'"]])
vim.cmd([[autocmd InsertLeave * silent! execute "!echo -ne '\e[2 q'"]])

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd([[ set noswapfile ]])

-- line numbers
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.number = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
