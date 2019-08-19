import QtQuick 2.0
import Machinekit.Controls 1.0
import Machinekit.Application.Controls 1.0

JogKnob {
    property alias core: handler.core
    property alias status: handler.status
    property alias command: handler.command
    color: "#328930"

    id: root
    enabled: Handler.enabled
    minimumValue: Handler.minimumValue
    maximumValue: Handler.maximumValue

    Binding { target: root; property: "value"; value: Handler.value }
    Binding { target: Handler; property: "value"; value: root.value }

    FeedrateHandler {
        id: handler

    }

    TooltipArea {
        text: qsTr("Set " + axis + " axis velocity")
        interval: 1000
    }
}


/*##^## Designer {
    D{i:0;height:165;width:165}
}
 ##^##*/
