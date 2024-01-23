local wezterm = require("wezterm")

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local format_title = function(title, is_active, max_width, hover)
	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_left(title, max_width - 2)

	return {
		{ Text = SOLID_LEFT_ARROW .. "  " },
		{ Text = title },
		{ Text = "  " .. SOLID_RIGHT_ARROW },
	}
end

local guess_title = function(tab)
	local title = tab.active_pane.title
	if type(tab.tab_title) == "string" and #tab.tab_title > 0 then
		title = tab.tab_title
	end
	return title
end

local user_var_tab_title_key = "tab_title"
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- if there is title already set, proceed with it
	local title = guess_title(tab)
	return format_title(title, tab.is_active, max_width, hover)
end)

-- wezterm.on("update-right-status", function(window)
-- 	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
-- 	window:set_right_status({ Foreground = { Color = "#cad3f5" } }, wezterm.format({ { Text = " " .. date .. " " } }))
-- end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	wezterm.log_info("user-var-changed", name, value)
	if name == user_var_tab_title_key then
		pane:tab():set_title(value)
	end
end)

return {
	font = wezterm.font("FiraCode Nerd Font"),
	color_scheme = "nordfox",
	font_size = 14,
	-- dpi = 144.0,
	tab_max_width = 100,
	window_decorations = "RESIZE",
	tab_bar_at_bottom = false,
	use_fancy_tab_bar = false,
}
