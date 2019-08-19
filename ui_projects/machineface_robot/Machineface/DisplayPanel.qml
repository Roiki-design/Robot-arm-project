import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Window 2.0
import Machinekit.Application.Controls 1.0

DisplayPanelBase {
    id: root

    DigitalReadOut {
        x: 14
        y: 25
        width: 283
        height: 168
        transformOrigin: Item.Center
        scale: 1.0
        distanceToGoVisible: false
        axes: 7
        Layout.fillWidth: true
    }

    Item {
        Layout.fillHeight: true
    }
}
