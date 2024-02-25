local wezterm = require("wezterm")
local module = {}

module.font = wezterm.font_with_fallback({
  "FiraCode Nerd Font",
  { family = "Symbols Nerd Font Mono", scale = 0.75 },
  "JetBrains Mono Nerd Font",
  { family = "Symbols Nerd Font Mono", scale = 0.75 },
})
module.font_size = 12

return module
