local beautfiul = require("beautiful")
local catpuccin = {
  morning = {
      flamingo = "#F2CDCD",
      mauve = "#DDB6F2",
      pink = "#F5C2E7",
      maroon = "#E8A2AF",
      red = "#F28FAD",
      peach = "#F8BD96",
      yellow = "#FAE3B0",
      green = "#ABE9B3",
      teal = "#B5E8E0",
      blue = "#96CDFB",
      sky = "#89DCEB",
  },
  night = {
    black0 = "#161320",
    black1 = "#1A1826",
    black2 = "#1E1E2E",
    black3 = "#302D41",
    black4 = "#575268",
    gray0 = "#6E6C7E",
    gray1 = "#988BA2",
    gray2 = "#C3BAC6",
    white = "#D9E0EE",
    lavender = "#C9CBFF",
    rosewater = "#F5E0DC"
  }
}

local theme = {
  font = "Fira Code Nerd Font Mono 10",
  useless_gap = 10,
  border_width = 4,
  border_normal = catpuccin.night.black4,
  border_focus = catpuccin.night.lavender,


  wibar_fg = catpuccin.night.gray1,
  wibar_bg = catpuccin.night.black0,

  bar_component_bg = wibar_bg,
  wibar_border_width = 0,
  wibar_border_color = catpuccin.morning.flamingo,

  taglist_fg_focus = catpuccin.night.white,
  taglist_bg_focus = catpuccin.night.black3,

  tasklist_fg = catpuccin.night.white,
  tasklist_bg = catpuccin.night.black0,

  volume_fg = catpuccin.morning.peach,
  keyboardlayout_fg = catpuccin.morning.red,
  date_fg = catpuccin.morning.green,
  battery_fg = catpuccin.morning.flamingo,

  hotkeys_fg = catpuccin.night.white,
  hotkeys_bg = catpuccin.night.black3,
  hotkeys_border_width = 4,
  hotkeys_border_color = catpuccin.morning.green,

  notification_fg = catpuccin.night.white,
  notification_bg = catpuccin.night.black1,
  notification_border_width = 4,
  notification_border_color = catpuccin.night.gray0,
  notification_max_height = 160,
  notification_max_width = 512,
  notification_opacity = 1,

  pallet = catpuccin
}

theme.gtk = beautfiul.gtk.get_theme_variables()
theme.gtk = {
  font_size = 10,
  font_family = "Fira Code Nerd Font Mono",
  fg_color = catpuccin.night.white,
  bg_color = catpuccin.night.black0,
  base_color = catpuccin.night.black3,
}

return theme
