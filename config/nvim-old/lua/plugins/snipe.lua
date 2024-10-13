return {
	"leath-dub/snipe.nvim",
	config = function()
		local snipe = require("snipe")
		snipe:setup()
		vim.keymap.set("n", "<leader>gb", function()
			snipe:open_buffer_menu()
		end, { desc = "Snipe buffers" })
	end,
	-- keys = {
	-- 	{
	-- 		"gb",
	-- 		function()
	-- 			require("snipe").open_buffer_menu()
	-- 		end,
	-- 		desc = "Open Snipe buffer menu",
	-- 	},
	-- },
	-- opts = {},
}
