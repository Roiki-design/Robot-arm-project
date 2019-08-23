import QtQuick 2.12
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.12
import QtQuick.Window 2.0
import QtQuick.Controls.Imagine 2.12
import Machinekit.Controls 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Service 1.0


StatusBar {
    id: statusBar

    RowLayout{
        anchors.fill: parent

            Led {
                id: element
                radius: 0
            }

            Led {
                id: element1
                radius: 0
            }

            Led {
                id: element2
                radius: 0
            }

            Button {
                id: button
                text: qsTr("Button")
            }

            Button {
                id: button1
                text: qsTr("Button")
            }

            Button {
                id: button2
                text: qsTr("Button")
            }
}
}
/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
