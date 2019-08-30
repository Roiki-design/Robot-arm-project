import QtQuick 2.6
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import QtQml 2.2
import QtQuick.Controls.Imagine 2.12
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0


ApplicationItem {
    property var numberModel: defaultHandler.incrementsModel
    property var numberModelReverse: defaultHandler.incrementsModelReverse
    property var axisColors: ["#F5A9A9", "#A9F5F2", "#81F781", "#D2B48C", "#D28ED0", "#CFCC67"]
    property color allColor: "#DDD"
    property color specialColor: "#BBBBBB"
    property var axisNames: ["X", "Y", "Z", "A", "B", "C", "U", "V", "W"] // should come from INI/config
    property string eName: "E"
    property string eUnits: "mm/s"
    property bool zVisible: status.synced ? status.config.axes > 2 : true
    property bool aVisible: status.synced ? status.config.axes > 3 : true
    property bool eVisible: halRemoteComponent.connected || eWasConnected
    property bool eWasConnected: false
    property bool eEnabled: halRemoteComponent.connected
    property int buttonBaseHeight: container.height / (numberModel.length*2+1)

    property int baseSize: Math.min(width, height)
    property int fontSize: baseSize * 0.028

    id: root

    JogDistanceHandler {
        id: defaultHandler
        continuousText: "inf"
        core: root.core
        axis: -1
    }

Rectangle{
    border.color: colorMain
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity
        visible: root.status.synced

        Item {
            id: container
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: Math.min(width / 1.6, parent.height)

            Item {
                id: mainItem
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                width: height

                JogDistanceHandler {
                    readonly property int buttonBaseSize: container.height / (incrementsModel.length*2+1)

                    id: xyHandler
                    continuousText: "inf"
                    core: root.core
                    axis: 0
                }

                RowLayout {
                    id: jogButtonGrid
                    spacing: 2


                    Column {
                        id: labelColumn
                        Layout.fillHeight: true


                        Repeater {
                            model: ["0", "1", "2", "3", "4", "5", "6"]

                            Button {
                                id: button
                                text: modelData
                                leftPadding: 4
                                rightPadding: 4
                                topPadding: 12
                                bottomPadding: 12
                                implicitWidth: 170 *(1 + (((window.height -1280) / 100)/10))
                                implicitHeight: 55 * (1 + (((window.width -800) / 100)/10))
                                enabled: false
                                icon.name: "placeholder"
                                icon.width: 44
                                icon.height: 44
                                display: Button.TextUnderIcon



                                contentItem: Text {
                                    text: button.text
                                    font: button.font
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                             }



                               }
                            }
                        }




                    Column {
                        id: columNeg
                        Layout.fillHeight: true



                        Repeater{
                            model: ["0", "1", "2", "3", "4", "5", "6"]
                            JogButtonMod {
                                id: jointNeg

                                enabled: true
                                Layout.fillHeight: true
                                Layout.fillWidth: false
                                direction: -1
                                distance: 0.1
                                axis: modelData


                            }
                        }

                    }

                    Column {
                        id: columnPos

                        Layout.fillHeight: true
                        Repeater{
                            model: ["0", "1", "2", "3", "4", "5", "6"]
                            JogButtonMod {
                                id: jointpos

                                enabled: true
                                Layout.fillHeight: true
                                Layout.fillWidth: false
                                direction: 1
                                distance: 0.1
                                axis: modelData

                            }
                        }

                    }


                }














            }
        }
    }


}
}









































































































































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:6;anchors_height:420;anchors_width:242}
}
 ##^##*/
