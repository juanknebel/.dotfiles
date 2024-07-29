local merge = require("utils").merge
local cursor = require("cursor")
local font = require("font")
local startup = require("startup")
local ui = require("ui")
local mouse_binds = require("mouse_binds")
local shell = require("shell")
local keybinds = require("keybinds")
local toggle = require("toggle")

return merge(cursor, font, startup, ui, mouse_binds, shell, keybinds, toggle)
