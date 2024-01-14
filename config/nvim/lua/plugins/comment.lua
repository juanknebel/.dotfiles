return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			-- <C-_> == <CTRL> /
			-- toggler = { line = "<C-_>" },
			-- opleader = { line = "<C-_>" },
		})
	end,
}
