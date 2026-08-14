local g = require("globals")
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(g.mainMod .. " + Return", hl.dsp.exec_cmd(g.terminal))
hl.bind(g.mainMod .. " + E", hl.dsp.exec_cmd(g.fileManager))
hl.bind(g.mainMod .. " + R", hl.dsp.exec_cmd(g.menu))
hl.bind("Print", hl.dsp.exec_cmd(g.screenshotArea))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(g.screenshotFullscreen))

hl.bind(g.mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(g.mainMod .. " + SHIFT + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(g.mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(g.mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(g.mainMod .. " + C", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(g.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(g.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(g.mainMod .. " + J", hl.dsp.focus({ direction = "up" }))
hl.bind(g.mainMod .. " + K", hl.dsp.focus({ direction = "down" }))


hl.bind(g.mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(g.mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(g.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "up" }))
hl.bind(g.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "down" }))


hl.bind(g.mainMod .. " + Left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
hl.bind(g.mainMod .. " + Right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
hl.bind(g.mainMod .. " + Up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))
hl.bind(g.mainMod .. " + Down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(g.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(g.mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- -- Example special workspace (scratchpad)
-- hl.bind(g.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(g.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(g.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(g.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(g.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(g.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
