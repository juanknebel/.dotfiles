local wezterm = require("wezterm")

local toggleBlur = wezterm.action_callback(function(window)
	if window:effective_config().window_background_opacity == 1 then
		window:set_config_overrides({ window_background_opacity = 0.8 })
	else
		window:set_config_overrides({ window_background_opacity = 1 })
	end
end)

return {
	keys = {
		{
			mods = "CTRL",
			key = "b",
			action = toggleBlur,
		},
	},
}
