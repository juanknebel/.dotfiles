local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	end

	local home = wezterm.home_dir

	local home_tab, home_pane, window = mux.spawn_window({
		args = args,
		workspace = "default",
		cwd = home,
	})
	home_tab:set_title("zero")

	local git_tab = window:spawn_tab({ cwd = home .. "/git" })
	git_tab:set_title("git")

	local downloads_tab = window:spawn_tab({ cwd = home .. "/Downloads" })
	downloads_tab:set_title("Downloads")

	--local stats_tab, stats_pane = window:spawn_tab({ cwd = home })
	--stats_pane:send_text("btop\n")
	--stats_tab:set_title("Stats")

	window:gui_window():perform_action(act.ActivateTab(0), home_pane)
end)

return {}
