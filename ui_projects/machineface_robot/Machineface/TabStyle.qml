import QtQuick 2.0
import QtQuick.Controls.Styles 1.4

TabViewStyle{
    tab: Rectangle {
              color: "black"
              implicitWidth: Math.max(text.width +100, 80)
              implicitHeight: 100

        Rectangle {
            anchors.fill:parent
            anchors.bottomMargin: 2
            radius: 2
            color:styleData.selected ? colorDarkGrey:colorLightGrey
            border.color: colorMain
        }
            Text {
                id: text
                anchors.fill: parent
                anchors.centerIn: parent
                text: styleData.title
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: styleData.selected ? "white": "black"

            }
        }
    frame: Rectangle{
        color: "transparent"

    }
    }


