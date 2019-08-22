import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import Machinekit.PathView 1.0

Tab {
    title: qsTr("Program")

    SourceView {
        anchors.fill: parent
        anchors.margins: Screen.pixelDensity * 1
    }
}
