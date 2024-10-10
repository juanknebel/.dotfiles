require "nvchad.mappings"

local map = vim.keymap.set
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "General Clean search" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
