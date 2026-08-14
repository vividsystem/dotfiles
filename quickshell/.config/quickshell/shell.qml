import Quickshell
import Quickshell.Io

import QtQuick
import QtQuick.Layouts

// https://programmersd21.github.io/the_quickshell_book/

PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30
	color: Theme.bg

	RowLayout {
		id: row
		anchors {
			fill: parent
			verticalCenter: parent.verticalCenter
			leftMargin: 8
			rightMargin: 8
		}
		spacing: 8

	// Workspaces
		Workspaces {}

		Item { Layout.fillWidth: true }



		Clock {}
		Battery {
			id: battery
			visible: battery.available
		}

  }
}
