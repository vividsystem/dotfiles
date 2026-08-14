import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}

	Text {
		text: Qt.formatDateTime(clock.date, "ddd dd. MMM")

		color: Theme.accent1
		font { 
			pixelSize: 14
		}
	}

	Text {
		text: Qt.formatDateTime(clock.date, "hh:mm")

		color: Theme.accent1
		font { 
			pixelSize: 14
			bold: true 
		}
	}
}
