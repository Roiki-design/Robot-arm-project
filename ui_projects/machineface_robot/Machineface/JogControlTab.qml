import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Tab {
    id: tab
    title: qsTr("Jog")
    Rectangle{
        anchors.fill: parent
        color: "black"
         Item {
             ButtonJog {
                anchors.fill: parent
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
        }
    }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:767;width:425}
}
 ##^##*/
