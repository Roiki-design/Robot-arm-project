import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0


Tab {
    id: mditab
    title: qsTr("MDI")

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        JogStick {
            id: jogStick1
            xAxis: 5
            yAxis: 4
        }

        JogStick {
            id: jogStick2
            xAxis: 3
            yAxis: 2
        }

        JogStick {
            id: jogStick3
            xAxis: 1
            yAxis: 0
        }

        JogStick {
            id: jogStick4
            xAxis: 6
            yAxis: 7
        }
    }

}







/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:100;anchors_width:100;anchors_x:"-99";anchors_y:48}
}
 ##^##*/
