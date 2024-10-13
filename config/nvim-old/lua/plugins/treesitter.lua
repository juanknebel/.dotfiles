return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = {
					"lua",
					"go",
					"rust",
					"python",
					"java",
					"bash",
					"fish",
					"dockerfile",
					"latex",
					"ruby",
					"json",
					"html",
					"sql",
					"csv",
					"toml",
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
