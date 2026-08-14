import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
	id: workspaces
	Repeater {
		model: 9

		Text {
			property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
			property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
			// property var ws: WindowManager.windowsets[i]
			// property var isActive: ws.active
			text: index + 1
			color: isActive ? Theme.accent0 : (ws ? Theme.fg : Theme.fgAlt)
			font { pixelSize: 14 }
		}
	}
}
