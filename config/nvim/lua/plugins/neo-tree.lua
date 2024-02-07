return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Open NeoTree" })
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Open NeoTree" })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "List buffers" })
		require("neo-tree").setup({
			window = {
				position = "left",
				width = 40,
			},
			mappings = {
				["q"] = "close_window",
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
			},
		})
	end,
}
