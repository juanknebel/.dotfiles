local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"wbthomason/packer.nvim",

	-- colorshcemas --
	"ellisonleao/gruvbox.nvim",
	"rebelot/kanagawa.nvim",
	{
		"dracula/vim",
		lazy = false,
	},
	"arcticicestudio/nord-vim",
	"folke/tokyonight.nvim",
	"catppuccin/nvim",

	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"nvim-treesitter/nvim-treesitter",
	"bluz71/vim-nightfly-colors",
	"vim-test/vim-test",
	"lewis6991/gitsigns.nvim",
	"preservim/vimux",
	"christoomey/vim-tmux-navigator",
	"tpope/vim-fugitive",
	"tpope/vim-commentary",

	-- rust babyyyyyyy
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"simrat39/rust-tools.nvim",
	"rust-lang/rust.vim",
	"saecki/crates.nvim",

	-- Java
	"mfussenegger/nvim-jdtls",

	-- Formatting
	"jose-elias-alvarez/null-ls.nvim",

	"tpope/vim-surround",

	-- completion
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"github/copilot.vim",
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",
	"glepnir/lspsaga.nvim",

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		--tag = '0.1.0',
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- flotating term
	"voldikss/vim-floaterm",

	-- flotating cmd line
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	-- plant uml
	{
		"javiorfo/nvim-soil",
		lazy = true,
		ft = "plantuml",
		config = function()
			-- If you want to change default configurations
		end,
	},
	"javiorfo/nvim-nyctophilia",
}

local opts = {}

require("lazy").setup(plugins, opts)
