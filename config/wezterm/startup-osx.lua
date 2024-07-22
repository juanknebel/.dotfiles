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
	home_tab:set_title("HOME")
	local gui_windows = window:gui_window()
	gui_windows:maximize()
	home_tab:activate()
	home_pane:activate()

	-- local router_tab = window:spawn_tab({ cwd = home .. "/git/fury_mpcs-payment-router" })
	-- router_tab:set_title("router")
	--
	-- local agreements_lib_tab = window:spawn_tab({ cwd = home .. "/git/fury_mpcs-agreements-lib" })
	-- agreements_lib_tab:set_title("agreements-lib")
	--
	-- local agreements_tab = window:spawn_tab({ cwd = home .. "/git/fury_mpcs-agreements" })
	-- agreements_tab:set_title("agreements")
	--
	-- local agreements_read_tab = window:spawn_tab({ cwd = home .. "/git/fury_mpcs-agreements-read" })
	-- agreements_read_tab:set_title("agreements-read")
	--
	-- local git_tab = window:spawn_tab({ cwd = home .. "/git" })
	-- git_tab:set_title("git")
	--
	-- local downloads_tab = window:spawn_tab({ cwd = home .. "/Downloads" })
	-- downloads_tab:set_title("Downloads")

	gui_windows:perform_action(act.ActivateTab(0), home_pane)
end)

return {}
