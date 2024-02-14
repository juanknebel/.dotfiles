local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local shell = require("shell")

wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	else
    args = shell.default_prog
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

	local raftita_tab = window:spawn_tab({ cwd = home .. "/git/raft-ik" })
	raftita_tab:set_title("raft-ik")

	local hummingbird_tab = window:spawn_tab({ cwd = home .. "/git/hummingbird" })
	hummingbird_tab:set_title("hummingbird")

	local cala_tourist_tab = window:spawn_tab({ cwd = home .. "/git/cala-tourist" })
	cala_tourist_tab:set_title("cala-tourist")

	local cala_recruiter_tab = window:spawn_tab({ cwd = home .. "/git/cala-recruiter" })
	cala_recruiter_tab:set_title("cala-recruiter")

	local downloads_tab = window:spawn_tab({ cwd = home .. "/Downloads" })
	downloads_tab:set_title("Downloads")

	--local stats_tab, stats_pane = window:spawn_tab({ cwd = home })
	--stats_pane:send_text("btop\n")
	--stats_tab:set_title("Stats")

	local gui_windows = window:gui_window()
	gui_windows:perform_action(act.ActivateTab(0), home_pane)
	gui_windows:maximize()
end)

return {}
