import QtQuick 2.0
import Machinekit.Controls 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0

JogKnob {
    property alias core: handler.core
    property alias status: handler.status
    property alias command: handler.command
    property alias displayValue: handler.displayValue
    property alias units: handler.units
    property alias proportional: handler.proportional
    color: "#328930"

    id: root
    enabled: handler.enabled
    minimumValue: handler.proportional ? handler.minimumProportion : handler.minimumValue
    maximumValue: handler.proportional ? 100.0 : handler.maximumValue



    MaximumVelocityHandler {
        id: handler

    }

    Binding { target: root; property: "value"; value: handler.value }
    Binding { target: handler; property: "value"; value: root.value }

}


/*##^## Designer {
    D{i:0;height:165;width:165}
}
 ##^##*/
