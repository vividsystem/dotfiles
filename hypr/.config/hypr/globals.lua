local M = {
	mainMod              = "SUPER",
	terminal             = "kitty",
	fileManager          = "dolphin",
	menu                 = "rofi -show run",
	screenshotArea       = 'grim -g "$(slurp)" -  | swappy -f -',
	screenshotFullscreen =
	"grim -o \"$(hyprctl monitors | awk '/Monitor/{mon=$2} /focused: yes/{print mon}')\" - | wl-copy",
}

return M
