import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Tab {
    id: tab
    title: qsTr("Jog")



    GridLayout{
        id: jogGrid
        rows: 20
        columns: 20
        anchors.fill: parent
        property double colMulti : jogGrid.width / jogGrid.columns
        property double rowMulti : jogGrid.height / jogGrid.rows
        function prefWidth(item){
            return colMulti * item.Layout.columnSpan
        }
        function prefHeight(item){
            return rowMulti * item.Layout.rowSpan

        }


            Rectangle{
                color: "transparent"
                border.color: colorMain
                Layout.rowSpan: 15
                Layout.columnSpan: 5
                Layout.preferredWidth : jogGrid.prefWidth(this)
                Layout.preferredHeight : jogGrid.prefHeight(this)

                JogStickTab{}

          }

            Rectangle{
                color: "transparent"
                border.color: colorMain
                Layout.rowSpan: 15
                Layout.columnSpan: 10
                Layout.preferredWidth : jogGrid.prefWidth(this)
                Layout.preferredHeight : jogGrid.prefHeight(this)

                ButtonJog {}

          }
            Rectangle{
                color: "transparent"

                Layout.rowSpan: 20
                Layout.columnSpan:5
                Layout.preferredWidth : jogGrid.prefWidth(this)
                Layout.preferredHeight : jogGrid.prefHeight(this)


                ColumnLayout{
                    id: buttonColumn
                    spacing: 15



                    Button {
                        id: button
                        text: qsTr("Button")
                        leftPadding: 4
                        rightPadding: 4
                        topPadding: 12
                        bottomPadding: 12
                        Layout.fillWidth: true
                        implicitHeight: 100 * (1 + (((window.width -800) / 100)/10))
                        icon.name: "placeholder"
                        icon.width: 44
                        icon.height: 44
                        display: Button.TextUnderIcon


                    }

                    Button {
                        id: button1
                        text: qsTr("Button")
                        leftPadding: 4
                        rightPadding: 4
                        topPadding: 12
                        bottomPadding: 12
                        Layout.fillWidth: true
                        implicitHeight: 100 * (1 + (((window.width -800) / 100)/10))
                        icon.name: "placeholder"
                        icon.width: 44
                        icon.height: 44
                        display: Button.TextUnderIcon

                    }

                    Button {
                        id: button2
                        text: qsTr("Button")
                        leftPadding: 4
                        rightPadding: 4
                        topPadding: 12
                        bottomPadding: 12
                        Layout.fillWidth: true
                        implicitHeight: 100 * (1 + (((window.width -800) / 100)/10))
                        icon.name: "placeholder"
                        icon.width: 44
                        icon.height: 44
                        display: Button.TextUnderIcon

                    }

                    Button {
                        id: button3
                        text: qsTr("Button")
                        leftPadding: 4
                        rightPadding: 4
                        topPadding: 12
                        bottomPadding: 12
                        Layout.fillWidth: true
                        implicitHeight: 100 * (1 + (((window.width -800) / 100)/10))
                        icon.name: "placeholder"
                        icon.width: 44
                        icon.height: 44
                        display: Button.TextUnderIcon

                    }



                }


             }

            Rectangle{
                color: "transparent"

                Layout.rowSpan: 5
                Layout.columnSpan: 15
                Layout.preferredWidth : jogGrid.prefWidth(this)
                Layout.preferredHeight : jogGrid.prefHeight(this)

                FeedrateAndHomeGrid {}

             }

             }



}









/*##^## Designer {
    D{i:0;autoSize:true;height:767;width:425}
}
 ##^##*/
