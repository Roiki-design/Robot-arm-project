import QtQuick 2.0
import QTQuick.VirtualKeyboard 2.1

Item {
    id: root
    Item {
        id:appContainer
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: InputPanel.top
    }
    InputPanel {
        id:inputPanel
        y: Qt.inputMethod.visible ? parent.height - inputPanel.height : parent.height
        anchors.left: parent.left
        anchors.right: parent.right
    }

}
