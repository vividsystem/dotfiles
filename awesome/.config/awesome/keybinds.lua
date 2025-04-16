local awful = require("awful")
local gears = require("gears")
local opts = require("opts")

local hotkeys_popup = require("awful.hotkeys_popup")

local function key(mods, normal, func, description, group)
	return awful.key(mods, normal, func, {description = description, group = group})
end


-- {{{ Key bindings
local M = {}
M.globalkeys = gears.table.join(
		key({opts.modkey}, "s", hotkeys_popup.show_help, "show help", "awesome"),
		key({opts.modkey}, "Escape", awful.tag.history.restore, "go back", "tag"),
		key({}, "F12", function ()
			local current_client = awful.client.focus
    	if current_client then
        	current_client.maximized = false
    	end
		end, nil,nil),

		key({opts.modkey}, "j", function ()
      awful.client.focus.byidx(1)
		end, "focus next (by index)", "client"),
		key({opts.modkey}, "k", function ()
      awful.client.focus.byidx(-1)
		end, "focus previous (by index)", "client"),

		-- key({opts.modkey}, "w", function () mymainmenu:show() end, 
		-- "show main menu", "awesome"),

    -- Layout manipulation
    key({opts.modkey, "Shift"}, "j", function ()
			awful.client.swap.byidx(  1)
		end, "swap with next client by index", "client"),
    key({opts.modkey, "Shift"}, "k", function ()
			awful.client.swap.byidx( -1)
		end, "swap with previous client by index", "client"),

		-- Screen Focus
    key({opts.modkey, "Control"}, "j", function ()
			awful.screen.focus_relative( 1)
		end, "focus the next screen", "screen"),
    key({opts.modkey, "Control"}, "k", function ()
			awful.screen.focus_relative(-1)
		end, "focus the previous screen", "screen"),

		-- Focus/jumpto urgent
    key({opts.modkey}, "u", awful.client.urgent.jumpto, "jump to urgent client", "client"),

		-- Focus prev
    key({opts.modkey}, "Tab", function ()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
    end, "go back", "client"),

    -- Standard program
    key({opts.modkey}, "Return", function ()
			awful.spawn(opts.terminal) 
		end, "open a terminal", "launcher"),
    key({opts.modkey, "Control"}, "r", awesome.restart, "reload awesome", "awesome"),
    key({opts.modkey, "Shift"}, "q", awesome.quit, "quit awesome", "awesome"),

    key({ opts.modkey, "Control"}, "h", function ()
			awful.tag.incncol( 1, nil, true)
		end, "increase the number of columns", "layout"),
    key({ opts.modkey, "Control" }, "l", function ()
			awful.tag.incncol(-1, nil, true)
		end, "decrease the number of columns", "layout"),

    key({opts.modkey}, "space", function ()
			awful.layout.inc( 1)
		end, "select next", "layout"),

    key({opts.modkey, "Shift"}, "space", function ()
			awful.layout.inc(-1)
		end, "select previous", "layout"),

    key({opts.modkey, "Control"}, "n", function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
						"request::activate", "key.unminimize", {raise = true}
				)
			end
		end, "restore minimized", "client"),

    -- Prompt
    key({opts.modkey},"r", function ()
			awful.util.spawn(opts.run_prompt)
		end, "run prompt", "launcher"),
    key({opts.modkey}, "n", function()
			awful.util.spawn(string.format("%s -e %s", opts.terminal, opts.editor))
		end, "run editor",  "launcher"),

    key({opts.modkey}, "x", function ()
			awful.prompt.run {
				prompt       = "Run Lua code: ",
				textbox      = awful.screen.focused().mypromptbox.widget,
				exe_callback = awful.util.eval,
				history_path = awful.util.get_cache_dir() .. "/history_eval"
			}
		end, "lua execute prompt", "awesome")
)

M.clientkeys = gears.table.join(
    key({opts.modkey}, "f", function (c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, "toggle fullscreen", "client"),

    key({opts.modkey, "Shift"}, "c", function (c)
			c:kill()
		end, "close", "client"),

    key({opts.modkey, "Control"}, "Return", function (c)
			c:swap(awful.client.getmaster())
		end, "move to master", "client"),

    key({opts.modkey, "Shift"}, "Return", function (c)
			awful.client.setmaster(c)
		end, "set master to focused", "client"),

    key({opts.modkey}, "o", function (c)
			c:move_to_screen()
		end, "move to screen", "client"),

    key({opts.modkey}, "t", function (c)
			c.ontop = not c.ontop
		end, "toggle keep on top", "client"),

		-- TODO: fix this
    key({ opts.modkey }, "h", function (c)
			c:relative_move(100,  100, -200, -200)
		end, "enlarge", "client"),

		-- TODO: fix this
    key({opts.modkey, "Shift"}, "Prior", function (c)
			c:relative_move(100, 100,  200,  200) end, "shrink", "client")

)


M.clientbuttons = gears.table.join(
    awful.button({ opts.modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ opts.modkey}, 2, function (c)
        c:emit_signal("request::activate", "mouse_click", { raise = true}

    )
    end),
    awful.button({ opts.modkey }, 3, awful.mouse.client.resize)
)




-- }}}
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
--
for i = 1, 9 do
M.globalkeys = gears.table.join(M.globalkeys,
		-- View tag only.
		awful.key({ opts.modkey }, "#" .. i + 9,
							function ()
										local screen = awful.screen.focused()
										local tag = screen.tags[i]
										if tag then
											 tag:view_only()
										end
							end,
							{description = "view tag #"..i, group = "tag"}),
		-- Toggle tag display.
		awful.key({ opts.modkey, "Control" }, "#" .. i + 9,
							function ()
									local screen = awful.screen.focused()
									local tag = screen.tags[i]
									if tag then
										 awful.tag.viewtoggle(tag)
									end
							end,
							{description = "toggle tag #" .. i, group = "tag"}),
		-- Move client to tag.
		awful.key({ opts.modkey, "Shift" }, "#" .. i + 9,
							function ()
									if client.focus then
											local tag = client.focus.screen.tags[i]
											if tag then
													client.focus:move_to_tag(tag)
											end
								 end
							end,
							{description = "move focused client to tag #"..i, group = "tag"}),
		-- Toggle tag on focused client.
		awful.key({ opts.modkey, "Control", "Shift" }, "#" .. i + 9,
							function ()
									if client.focus then
											local tag = client.focus.screen.tags[i]
											if tag then
													client.focus:toggle_tag(tag)
											end
									end
							end,
							{description = "toggle focused client on tag #" .. i, group = "tag"})
	)
end

M.mousebinds = gears.table.join(
		awful.button({ }, 4, awful.tag.viewnext),
		awful.button({ }, 5, awful.tag.viewprev)
)

return M
