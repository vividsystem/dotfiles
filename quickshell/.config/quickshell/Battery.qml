import Quickshell
import Quickshell.Services.UPower
import QtQuick

Row {
  spacing: 6
	anchors.verticalCenter: parent.verticalCenter

  property var battery: UPower.devices.values[0]
  property int charge: battery ? battery.percent : -1
  property bool charging: battery ? battery.status === "charging" : false
  property bool pluggedIn: battery ? battery.status === "fully-charged" || battery.status === "charging" : false

  Text {
		anchors.verticalCenter: parent.verticalCenter
    text: {
      if (!battery) return ""
      if (battery.status === "charging") return ""
      if (battery.percentage * 100 <= 10) return ""
      if (battery.percentage * 100 <= 35) return ""
      if (battery.percentage * 100 <= 65) return ""
      if (battery.percentage * 100 <= 85) return ""
      return ""
    }
    font.pixelSize: 16
    color: {
      if (!battery) return "#6c7086"
      if (battery.percentage * 100 <= 10) return Theme.error
      if (battery.percentage * 100 <= 20) return Theme.warning
      return Theme.success
    }
  }

  Text {
		anchors.verticalCenter: parent.verticalCenter
    text: battery ? battery.percentage * 100 + "%" : ""
    font.pixelSize: 14
    color: Theme.fg
    visible: battery !== undefined
  }
}
