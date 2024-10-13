return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				highlights = {
					fill = {
						guifg = "#1a1b26",
						guibg = "#1a1b26",
					},
					background = {
						guifg = "#1a1b26",
						guibg = "#1a1b26",
					},
					-- Customize the text color of the active buffer tab
					tab_selected = {
						guifg = "#eceff4",
						guibg = "#3b4252",
					},
					-- Customize the text color of non-selected buffer tabs
					tab = {
						guifg = "#81a1c1",
						guibg = "#1a1b26",
					},
				},
			},
		})
	end,
}
