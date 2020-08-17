import QtQuick 2.7
import MuseScore.UiComponents 1.0
import MuseScore.VST 1.0

Rectangle {

    color: "#0fb9b1"

    VSTDevTools {
        id: devtools
    }

    Column {
        id: column
        padding: 5
        anchors.fill: parent
        spacing: 2

        Row {
            id: selector
            height: 75
            anchors.right: parent.right
            anchors.left: parent.left

            StyledComboBox {
                id: pluginSelector
                width: parent.width / 2

                valueRoleName: "uid"
                textRoleName: "name"

                model: devtools.plugins
            }

            FlatButton {
                text: "Add instance"
                onClicked: devtools.addInstance(pluginSelector.currentIndex)
            }
        }

        Row {
            id: instances
            anchors.top: selector.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom

            Column {
                anchors.fill: parent

                Repeater {
                    anchors.fill: parent
                    model: devtools.instances
                    Row {
                        height: 50
                        anchors.left: parent.left
                        anchors.right: parent.right

                        Text {
                            id: element
                            text: devtools.pluginName(index)
                            width: parent.width - 240
                        }

                        FlatButton {
                            width: 120
                            text: "edit"
                            onClicked: devtools.showEditor(index)

                        }

                        FlatButton {
                            width: 120
                            text: "play"
                            onClicked: devtools.play(index)
                        }

                    }
                }
            }
        }
    }
}
