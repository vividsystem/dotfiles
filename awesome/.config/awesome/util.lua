local M = {}
local theme = require("themes.catpuccin")
local wibox = require("wibox")

function M.bar_component(callback, fg, bg, widget)
	return {
		callback,
		fg = fg or theme.wibar_fg,
		bg = bg or theme.bar_component_bg,
		widget = wibox.container.background
	}
end

return M
