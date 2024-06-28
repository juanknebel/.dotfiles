return {
	{
		"ellisonleao/glow.nvim",
		-- config = true,
		cmd = "Glow",
		config = function()
			require("glow").setup({
				style = "dark",
				width = 120,
				border = "solid",
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>kw", ":MarkdownPreview<CR>", { desc = "Markdown Preview" })
			vim.keymap.set("n", "<leader>kpt", ":MarkdownPreviewToggle<CR>", { desc = "Markdown Preview Toggle" })
			vim.keymap.set("n", "<leader>kps", ":MarkdownPreviewStop<CR>", { desc = "Markdown Preview Stop" })

			vim.g.mkdp_auto_start = 0
			vim.g.mkdp_auto_close = 1
			vim.g.mkdp_refresh_slow = 0
			vim.g.mkdp_browser = "falkon"
			vim.g.mkdp_port = "17000"

			-- Options for Markdown rendering
			-- mkit: markdown-it options for rendering
			-- katex: KaTeX options for math
			-- uml: markdown-it-plantuml options
			-- maid: mermaid options
			-- disable_sync_scroll: whether to disable sync scroll, default 0
			-- sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
			--   middle: means the cursor position is always at the middle of the preview page
			--   top: means the Vim top viewport always shows up at the top of the preview page
			--   relative: means the cursor position is always at relative position of the preview page
			-- hide_yaml_meta: whether to hide YAML metadata, default is 1
			-- sequence_diagrams: js-sequence-diagrams options
			-- content_editable: if enable content editable for preview page, default: v:false
			-- disable_filename: if disable filename header for preview page, default: 0
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 0,
				toc = {},
			}
			vim.g.mkdp_page_title = "「${name}」"

			-- Use a custom location for images
			vim.g.mkdp_images_path = "~/.markdown_images"
		end,
	},
}
