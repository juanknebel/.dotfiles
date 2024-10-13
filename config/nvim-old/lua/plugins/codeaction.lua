return {
	"weilbith/nvim-code-action-menu",
	cmd = "CodeActionMenu",
	vim.keymap.set("n", "<leader>ca", ":CodeActionMenu<CR>", { desc = "Code actions" }),
}
