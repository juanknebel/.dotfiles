return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<leader>t]],
			-- on_open = function(_term)
			-- 	vim.cmd("startinsert!")
			-- end,
			-- on_close = function(_term)
			-- 	vim.cmd("startinsert!")
			-- end,
			size = 75,
			direction = "vertical",
			float_opts = {
				border = "curved",
				winblend = 6,
			},
			close_on_exit = true,
			terminal_mappings = false,
		})
		-- local create_floating_terminal = require("core.utils.utils").create_floating_terminal
		-- local term = require("toggleterm.terminal")
		--
		-- local M = {}
		-- M.lazygit_toggle = create_floating_terminal(term, "lazygit")
		-- M.gdu_toggle = create_floating_terminal(term, "gdu")
		-- M.bashtop_toggle = create_floating_terminal(term, "bashtop")
	end,
}
