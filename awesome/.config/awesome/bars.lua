local awful = require("awful")
local wibox = require("wibox")

local theme = require("themes/catpuccin")

local widgets = require("widgets")

local bars = {}

function bars:top(s)
	local bar = awful.wibar({
		position = "top",
		screen = s,
		height = "48",
	})
	bar:setup({
		layout = wibox.layout.align.horizontal,
		{--Left
			layout = wibox.layout.fixed.horizontal,
			widgets:taglist(s),
		},
		-- Middle
    widgets:tasklist(s),
		{-- Right
			layout = wibox.layout.fixed.horizontal,
			widgets:keyboardlayout(),
			wibox.widget.systray(),
			widgets:textclock({ timezone = "Europe/Berlin"}),
			widgets:textclock({
				format = "BA: %H:%M",
				timezone = "-03"
			}),
			widgets:battery()
		}
	})

	return bar
end




return bars
