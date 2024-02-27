return {
	"vim-test/vim-test",
	config = function()
		vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", { desc = "Run test in this file" })
		vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", { desc = "Run the test suite" })
		vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", { desc = "Run the last test" })
		vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", { desc = "Run the nearest test" })
		vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { desc = "Visit the last test" })
	end,
}
