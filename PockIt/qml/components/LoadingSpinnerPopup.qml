import QtQuick 2.4
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

Dialog {
    id: dialog

    Connections {
        target: mainView
        onEntryworksfinished: {
            PopupUtils.close(dialog)
        }
    }

    property string spinner_text: ""

    Column {
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            spacing: units.gu(1)
            anchors.horizontalCenter: parent.horizontalCenter

            ActivityIndicator {
                anchors.verticalCenter: parent.verticalCenter
                running: true
                z: 1
            }
            Label {
                text: spinner_text
                anchors.verticalCenter: parent.verticalCenter
                fontSize: "large"
                color: "#999999"
            }
        }
    }
}
