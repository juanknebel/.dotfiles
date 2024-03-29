-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>ml", "<C-w>>") -- resize to right
vim.keymap.set("n", "<leader>mh", "<C-w><") -- resize to left
vim.keymap.set("n", "<leader>mk", "<C-w>+") -- resize up
vim.keymap.set("n", "<leader>mj", "<C-w>-") -- resize down
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- flotating term
vim.keymap.set("n", "<leader>nn", ":FloatermNew --wintype=vsplit --width=0.3 --position=belowright <CR>")
vim.keymap.set("n", "<leader>nf", ":FloatermNew --wintype=float --height=0.4 --width=0.4 --position=topright <CR>")
vim.keymap.set("n", "<leader>np", ":FloatermPrev <CR>")
vim.keymap.set("n", "<leader>nx", "FloatermNext <CR>")
vim.keymap.set("n", "<leader>nt", ":FloatermToggle <CR>")
