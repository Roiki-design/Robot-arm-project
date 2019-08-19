import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import QtQml 2.2
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

    HalRemoteComponent {
        id: halRemoteComponent
        halrcmdUri: halrcmdService.uri
        halrcompUri: halrcompService.uri
        ready: (halrcmdService.ready && halrcompService.ready) || connected
        name: "fdm-ve-jog"
        containerItem: extruderControl
        create: false
        onErrorStringChanged: console.log(errorString)
        onConnectedChanged: root.eWasConnected = true
    }

    JogDistanceHandler {
        id: defaultHandler
        continuousText: "inf"
        core: root.core
        axis: -1
    }

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

                Grid {
                    id: grid1
                    y: 307
                    width: 400
                    height: 165
                    spacing: 20
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    rows: 1
                    columns: 2

                    HomeButton {
                        width: height
                        height: grid1.height * 0.8
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom
                        axis: -1
                        axisName: "All"
                        color: "white"
                        fontSize: root.fontSize
                    }

                    JogVelocityKnob {
                        id: jogVelocityKnob
                        height: grid1.height
                         width: height
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 200
                        axisName: "JogVel"
                        axis: -1
                    }

                    FeedrateKnob {
                        id: feedrateKnob
                        height: grid1.height
                        axisName: "Feedrate"
                        width: height
                        anchors.left: jogVelocityKnob.right
                        anchors.leftMargin: 10
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }


                }

                Grid {
                    id: grid
                    x: 97
                    y: 0
                    width: 168
                    height: 400
                    scale: 1
                    anchors.left: parent.left
                    anchors.leftMargin: 101
                    spacing: 10
                    rows: 7
                    columns: 2

                    JogButton {
                        id: joint1neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J1 -"
                        axis: 0
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint1pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J1 +"
                        axis: 0
                        distance: 0.1
                        direction: 1
                    }

                    JogButton {
                        id: joint2neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J2 -"
                        axis: 1
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint2pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J2 +"
                        axis: 1
                        distance: 0.1
                        direction: 1
                    }

                    JogButton {
                        id: joint3neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J3 -"
                        axis: 2
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint3pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J3 +"
                        axis: 2
                        distance: 0.1
                        direction: 1
                    }

                    JogButton {
                        id: joint4neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J4 -"
                        axis: 3
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint4pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J4 +"
                        axis: 3
                        distance: 0.1
                        direction: 1
                    }

                    JogButton {
                        id: joint5neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J5 -"
                        axis: 4
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint5pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J5 +"
                        axis: 4
                        distance: 0.1
                        direction: 1
                    }

                    JogButton {
                        id: joint6neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J6 -"
                        axis: 5
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint6pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J6 +"
                        axis: 5
                        distance: 0.1
                        direction: 1
                    }

                    JogButton {
                        id: joint7neg
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J7 -"
                        axis: 6
                        distance: 0.1
                        direction: -1
                    }

                    JogButton {
                        id: joint7pos
                        width: parent.height * 0.4
                        height: parent.height * 0.2
                        text: "J7 +"
                        axis: 6
                        distance: 0.1
                        direction: 1
                    }


                }








            }
        }
    }


}













































/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:637}D{i:7;anchors_x:0}D{i:11;anchors_x:101}
}
 ##^##*/
