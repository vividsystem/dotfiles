local awful = require("awful")
local wibox = require("wibox")
local theme = require("themes/catpuccin")
local lain = require("lain")
local gears = require("gears")

local widgets = {}

function widgets:keyboardlayout()
	return {
    awful.widget.keyboardlayout(),
    fg = theme.keyboardlayout_fg,
    bg = theme.bar_component_bg,
    widget = wibox.container.background
	}
end

function widgets:textclock()
	return {
    wibox.widget.textclock(),
    fg = theme.date_fg,
    bg = theme.bar_component_bg,
    widget = wibox.container.background
	}
end

function widgets:battery()
	return {
		lain.widget.bat({
			battery = "BAT0",
			settings = function()
					if bat_now.status ~= "N/A" then
							widget:set_markup(" " .. bat_now.status .." ".. bat_now.perc .. "% ")
					end
			end,
		}),
		fg = theme.battery_fg,
    bg = theme.bar_component_bg,
		widget = wibox.container.background
	}
end

function widgets:tasklist(s)
	-- Create a tasklist widget
	return awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.focused,
		style = {
			fg_normal = theme.tasklist_fg,
			bg_normal = theme.tasklist_bg
		},
		widget_template = {
			{
				{
					nil,
					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin
			},
			id = "background_role",
			widget = wibox.container.background,
		}
	}
end

function widgets:taglist(s)
	local taglist_buttons = gears.table.join(
		awful.button({ }, 1, function(t) t:view_only() end),
		awful.button({ modkey }, 1, function(t)
			if client.focus then
				client.focus:move_to_tag(t)
			end
		end),
		awful.button({ }, 3, awful.tag.viewtoggle),
		awful.button({ modkey }, 3, function(t)
			if client.focus then
				client.focus:toggle_tag(t)
			end
		end),
		awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
		awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
	)
	return awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		layout   = {
			spacing = 12,
			layout  = wibox.layout.fixed.horizontal
		},
		style  = {
			fg_focus = theme.taglist_fg_focus,
			bg_focus = theme.taglist_bg_focus
		},
		widget_template = {
			{
				{
					id     = 'text_role',
					widget = wibox.widget.textbox,
				},
				layout = wibox.layout.fixed.horizontal,
			},
			left  = 8,
			right = 8,
			widget = wibox.container.margin
		},
		buttons = taglist_buttons
	}

end

return widgets
