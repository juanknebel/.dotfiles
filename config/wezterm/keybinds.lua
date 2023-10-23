local wezterm = require("wezterm")
local action = wezterm.action

local function activate_pane(window, pane, pane_direction, vim_direction)
	local isViProcess = pane:get_foreground_process_name():find("n?vim") ~= nil
	if isViProcess then
		window:perform_action( -- This should match the keybinds you set in Neovim.
			action.SendKey({ key = vim_direction, mods = "CTRL" }),
			pane
		)
	else
		window:perform_action(action.ActivatePaneDirection(pane_direction), pane)
	end
end

wezterm.on("activate_pane_r", function(window, pane)
	activate_pane(window, pane, "Right", "l")
end)

wezterm.on("activate_pane_l", function(window, pane)
	activate_pane(window, pane, "Left", "h")
end)

wezterm.on("activate_pane_u", function(window, pane)
	activate_pane(window, pane, "Up", "k")
end)

wezterm.on("activate_pane_d", function(window, pane)
	activate_pane(window, pane, "Down", "j")
end)

local keys = {
	{
		key = "b",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			args = { "btop" },
		}),
	},
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = action({ PasteFrom = "Clipboard" }),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|ALT",
		action = action({ ActivateTabRelative = -1 }),
	},
	{
		key = "RightArrow",
		mods = "CTRL|ALT",
		action = action({ ActivateTabRelative = 1 }),
	},
	{
		key = "r",
		mods = "SUPER",
		action = action.ReloadConfiguration,
	},
	{
		key = "q",
		mods = "SUPER",
		action = action.QuitApplication,
	},
	{
		key = "c",
		mods = "LEADER",
		action = action({ SpawnTab = "CurrentPaneDomain" }),
	},
	{
		key = "n",
		mods = "LEADER",
		action = action.SpawnWindow,
	},
	{
		key = "w",
		mods = "LEADER",
		action = action({ CloseCurrentTab = { confirm = true } }),
	},
	{
		key = "1",
		mods = "CTRL",
		action = action({ ActivateTab = 0 }),
	},
	{
		key = "2",
		mods = "CTRL",
		action = action({ ActivateTab = 1 }),
	},
	{
		key = "3",
		mods = "CTRL",
		action = action({ ActivateTab = 2 }),
	},
	{
		key = "4",
		mods = "CTRL",
		action = action({ ActivateTab = 3 }),
	},
	{
		key = "5",
		mods = "CTRL",
		action = action({ ActivateTab = 4 }),
	},
	{
		key = "6",
		mods = "CTRL",
		action = action({ ActivateTab = 5 }),
	},
	{
		key = "7",
		mods = "CTRL",
		action = action({ ActivateTab = 6 }),
	},
	{
		key = "8",
		mods = "CTRL",
		action = action({ ActivateTab = 7 }),
	},
	{
		key = "9",
		mods = "CTRL",
		action = action({ ActivateTab = 8 }),
	},
	{
		key = "0",
		mods = "CTRL",
		action = action({ ActivateTab = 9 }),
	},
	{
		key = "|",
		mods = "CTRL|ALT|SHIFT",
		action = action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "-",
		mods = "CTRL|ALT",
		action = action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "h",
		mods = "CTRL|ALT",
		action = action.EmitEvent("activate_pane_l"),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = action.EmitEvent("activate_pane_d"),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = action.EmitEvent("activate_pane_u"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = action.EmitEvent("activate_pane_r"),
	},
	{
		key = "h",
		mods = "CTRL|ALT|SHIFT",
		action = action({ AdjustPaneSize = { "Left", 1 } }),
	},
	{
		key = "l",
		mods = "CTRL|ALT|SHIFT",
		action = action({ AdjustPaneSize = { "Right", 1 } }),
	},
	{
		key = "k",
		mods = "CTRL|ALT|SHIFT",
		action = action({ AdjustPaneSize = { "Up", 1 } }),
	},
	{
		key = "j",
		mods = "CTRL|ALT|SHIFT",
		action = action({ AdjustPaneSize = { "Down", 1 } }),
	},
}

return {
	disable_default_key_bindings = true,
	leader = { key = "a", mods = "ALT", timeout_milliseconds = 5000 },
	keys = keys,
}
