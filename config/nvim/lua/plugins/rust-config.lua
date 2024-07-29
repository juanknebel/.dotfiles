return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			local rt = require("rust-tools")
			rt.setup({
				server = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					on_attach = function(_, bufnr)
						vim.keymap.set(
							"n",
							"<Leader>k",
							rt.hover_actions.hover_actions,
							{ buffer = bufnr, desc = "Rust show actions" }
						)
						vim.keymap.set(
							"n",
							"<Leader>a",
							rt.code_action_group.code_action_group,
							{ buffer = bufnr, desc = "Rust code actions" }
						)
					end,
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
			})
			-- Auto format on saving
			vim.cmd([[autocmd FileType rust autocmd BufWritePre <buffer> RustFmt]])

			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_command = "rustfmt"

			-- Tabs
			vim.cmd([[autocmd FileType rust setlocal expandtab shiftwidth=2 softtabstop=2]])
		end,
	},
	{
		"rust-lang/rust.vim",
	},
	{
		"saecki/crates.nvim",
		config = function()
			require("crates").setup({
				smart_insert = true,
				insert_closing_quote = true,
				avoid_prerelease = true,
				autoload = true,
				autoupdate = true,
				autoupdate_throttle = 250,
				loading_indicator = true,
				date_format = "%Y-%m-%d",
				thousands_separator = ".",
				notification_title = "Crates",
				curl_args = { "-sL", "--retry", "1" },
				max_parallel_requests = 80,
				open_programs = { "xdg-open", "open" },
				disable_invalid_feature_diagnostic = false,
				text = {
					loading = "   Loading",
					version = "   %s",
					prerelease = "   %s",
					yanked = "   %s",
					nomatch = "   No match",
					upgrade = "   %s",
					error = "   Error fetching crate",
				},
				highlight = {
					loading = "CratesNvimLoading",
					version = "CratesNvimVersion",
					prerelease = "CratesNvimPreRelease",
					yanked = "CratesNvimYanked",
					nomatch = "CratesNvimNoMatch",
					upgrade = "CratesNvimUpgrade",
					error = "CratesNvimError",
				},
				popup = {
					autofocus = false,
					hide_on_select = false,
					copy_register = '"',
					style = "minimal",
					border = "none",
					show_version_date = false,
					show_dependency_version = true,
					max_height = 30,
					min_width = 20,
					padding = 1,
					text = {
						title = " %s",
						pill_left = "",
						pill_right = "",
						description = "%s",
						created_label = " created        ",
						created = "%s",
						updated_label = " updated        ",
						updated = "%s",
						downloads_label = " downloads      ",
						downloads = "%s",
						homepage_label = " homepage       ",
						homepage = "%s",
						repository_label = " repository     ",
						repository = "%s",
						documentation_label = " documentation  ",
						documentation = "%s",
						crates_io_label = " crates.io      ",
						crates_io = "%s",
						categories_label = " categories     ",
						keywords_label = " keywords       ",
						version = "  %s",
						prerelease = " %s",
						yanked = " %s",
						version_date = "  %s",
						feature = "  %s",
						enabled = " %s",
						transitive = " %s",
						normal_dependencies_title = " Dependencies",
						build_dependencies_title = " Build dependencies",
						dev_dependencies_title = " Dev dependencies",
						dependency = "  %s",
						optional = " %s",
						dependency_version = "  %s",
						loading = "  ",
					},
					highlight = {
						title = "CratesNvimPopupTitle",
						pill_text = "CratesNvimPopupPillText",
						pill_border = "CratesNvimPopupPillBorder",
						description = "CratesNvimPopupDescription",
						created_label = "CratesNvimPopupLabel",
						created = "CratesNvimPopupValue",
						updated_label = "CratesNvimPopupLabel",
						updated = "CratesNvimPopupValue",
						downloads_label = "CratesNvimPopupLabel",
						downloads = "CratesNvimPopupValue",
						homepage_label = "CratesNvimPopupLabel",
						homepage = "CratesNvimPopupUrl",
						repository_label = "CratesNvimPopupLabel",
						repository = "CratesNvimPopupUrl",
						documentation_label = "CratesNvimPopupLabel",
						documentation = "CratesNvimPopupUrl",
						crates_io_label = "CratesNvimPopupLabel",
						crates_io = "CratesNvimPopupUrl",
						categories_label = "CratesNvimPopupLabel",
						keywords_label = "CratesNvimPopupLabel",
						version = "CratesNvimPopupVersion",
						prerelease = "CratesNvimPopupPreRelease",
						yanked = "CratesNvimPopupYanked",
						version_date = "CratesNvimPopupVersionDate",
						feature = "CratesNvimPopupFeature",
						enabled = "CratesNvimPopupEnabled",
						transitive = "CratesNvimPopupTransitive",
						normal_dependencies_title = "CratesNvimPopupNormalDependenciesTitle",
						build_dependencies_title = "CratesNvimPopupBuildDependenciesTitle",
						dev_dependencies_title = "CratesNvimPopupDevDependenciesTitle",
						dependency = "CratesNvimPopupDependency",
						optional = "CratesNvimPopupOptional",
						dependency_version = "CratesNvimPopupDependencyVersion",
						loading = "CratesNvimPopupLoading",
					},
					keys = {
						hide = { "q", "<esc>" },
						open_url = { "<cr>" },
						select = { "<cr>" },
						select_alt = { "s" },
						toggle_feature = { "<cr>" },
						copy_value = { "yy" },
						goto_item = { "gd", "K", "<C-LeftMouse>" },
						jump_forward = { "<c-i>" },
						jump_back = { "<c-o>", "<C-RightMouse>" },
					},
				},
				src = {
					insert_closing_quote = true,
					text = {
						prerelease = "  pre-release ",
						yanked = "  yanked ",
					},
					coq = {
						enabled = false,
						name = "Crates",
					},
				},
				null_ls = {
					enabled = false,
					name = "Crates",
				},
			})
			vim.keymap.set("n", "<leader>rcu", function()
				require("crates").upgrade_all_crates()
			end, { desc = "Update all crates" })
		end,
	},
}
