import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

import Machinekit.Application.Controls 1.0

Tab {
    id: mditab
    title: qsTr("MDI")
    Rectangle{
        color:"transparent"


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
                        implicitHeight: Machineface.height / 10
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
            RowLayout{

                GridLayout {
                    id: numKeys
                    Layout.fillHeight: true
                    columns:3
                    Layout.rowSpan: 8

                    Repeater{
                        model:[qsTr("1"), qsTr("2"),qsTr("3"),qsTr("4"),qsTr("5"),qsTr("6"),qsTr("7"),qsTr("8"), qsTr("9"), qsTr("0"),       ]
                        Button {

                            style: ButtonStyle{}
                            Layout.preferredWidth: Machineface.width / 20
                            Layout.preferredHeight: Machineface.height / 12
                            text: modelData
                            onClicked: mdiCommandEdit.textField.text += modelData
                        }
                    }
                }

                GridLayout{
                    id: mdiKeys
                    Layout.fillHeight: true
                    columns: 6
                    Layout.rowSpan: 8

                    Repeater{
                        model:[qsTr("X"), qsTr("Y"),qsTr("Z"),qsTr("A"),qsTr("B"),qsTr("C"),qsTr("U"),qsTr("P"),qsTr("W"), qsTr("F"), qsTr("M"),
                            qsTr("0"),qsTr("G"),qsTr("G0"),qsTr("G1"),qsTr("G53"),qsTr("G4"),qsTr(".")       ]
                        Button {

                            style: ButtonStyle{}
                            Layout.preferredWidth: Machineface.width / 20
                            Layout.preferredHeight: Machineface.height / 12
                            text: modelData
                            onClicked: mdiCommandEdit.textField.text += modelData
                        }
                    }

                    Button{
                        Layout.preferredHeight: Machineface.height / 12
                        style: ButtonStyle{}
                        Layout.columnSpan: 2
                        text: "Space"
                        onClicked: mdiCommandEdit.textField.text += " "

                    }
                }


            }







            MdiCommandEdit {
                Layout.fillWidth: true
                id: mdiCommandEdit
            }







        }
    }
}





































/*##^## Designer {
    D{i:0;autoSize:true;height:1276.2204724409448;width:1704.7}
}
 ##^##*/
