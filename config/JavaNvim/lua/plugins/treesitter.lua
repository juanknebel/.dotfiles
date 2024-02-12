return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"lua",
					"java",
					"bash",
					"fish",
					"dockerfile",
					"ruby",
					"json",
					"html",
					"sql",
					"csv",
					"yaml",
					"markdown",
					"markdown_inline",
					"vim",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
