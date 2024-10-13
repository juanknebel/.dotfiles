return {
	{
		"tpope/vim-surround",
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"black",
					"gofumpt",
					"goimports-reviser",
					"golines",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					--null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.formatting.black,
					-- null_ls.builtins.formatting.isort,
					-- must be install using go install
					-- null_ls.builtins.formatting.gofmt,
					-- null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.golines,
				},
				on_attach = function(client, bufnr)
					-- Format the file before save the file
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
		end,
	},
}
