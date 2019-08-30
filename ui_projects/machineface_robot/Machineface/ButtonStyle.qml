import QtQuick 2.0
import QtQuick.Controls.Styles 1.4

ButtonStyle{
       background: Rectangle {
            implicitWidth: Math.max(text.width +100, 80)
            implicitHeight: 100
            anchors.fill:parent
            anchors.bottomMargin: 2
            radius: 2
            color: colorLightGrey
            border.color: colorMain
        }
            Text {
                id: text
                anchors.fill: parent
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"

            }
        }



