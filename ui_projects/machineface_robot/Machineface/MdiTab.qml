import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

import Machinekit.Application.Controls 1.0

Tab {
    id: tab
    title: qsTr("MDI")

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity

        RowLayout {
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            MdiHistoryTable {
                Layout.fillHeight: true
                Layout.fillWidth: true
                onCommandSelected: {
                    mdiCommandEdit.text = command
                }

                onCommandTriggered: {
                    mdiCommandEdit.text = command
                    mdiCommandEdit.action.trigger()
                }
            }

            ListView {
                Layout.fillHeight: true
                Layout.preferredWidth: dummyButton.width // 20 characters
                visible: count > 0
                model: userCommandAction.commands
                spacing: Screen.pixelDensity
                enabled: userCommandAction.enabled

                delegate: Button {
                    Layout.fillWidth: true
                    anchors.left: parent.left
                    anchors.right: parent.right
                    text: userCommandAction.commands[index].name
                    onClicked: userCommandAction.executeCommand(index)
                }

                Button {
                    id: dummyButton
                    text: "12345678901234567890"
                    visible: false
                }

                UserCommandAction {
                    id: userCommandAction
                }

            }

        }

        Grid {
            id: quickMDIbuttons

            height: 60
            width: RowLayout
            spacing: 20
            columns: 6
            rows: 1
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

            Button {
                id: button
                text: qsTr("Button")
                Layout.rowSpan: 6
            }

            Button {
                id: button1
                height: Grid.height
                text: qsTr("Button")
            }

            Button {
                id: button2
                height: Grid.height
                text: qsTr("Button")
            }

            Button {
                id: button3
                height: Grid.height
                text: qsTr("Button")
            }

            Button {
                id: button4
                height: Grid.height
                text: qsTr("Button")
            }

            Button {
                id: button5
                height: Grid.height
                text: qsTr("Button")
            }
        }

        MdiCommandEdit {
            Layout.fillWidth: true
            id: mdiCommandEdit
        }

    }
}

































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:637}
}
 ##^##*/
