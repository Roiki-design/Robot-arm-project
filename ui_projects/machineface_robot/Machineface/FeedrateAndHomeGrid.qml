import QtQuick 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Window 2.0
import QtQml 2.2
import QtQuick.Controls.Imagine 2.12
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.Service 1.0
import Machinekit.HalRemote 1.0
import Machinekit.HalRemote.Controls 1.0


RowLayout {
    id: feedrateAndHomeGrid


    
    
    HomeButton {
        
        axis: -1
        axisName: "All"
        color: colorDarkGrey
        Layout.fillWidth: true
        Layout.fillHeight: true
        fontSize: root.fontSize
    }
    
    JogVelocityKnob {
        id: jogVelocityKnob
        Layout.fillHeight: true
        Layout.fillWidth: true
        
        axisName: "JogVel"
        axis: -1

    }
    
    FeedrateKnob {
        id: feedrateKnob
        
        axisName: "Feedrate"
        width: height
        Layout.fillHeight: true
        Layout.fillWidth: true
        
    }
    
    
}
