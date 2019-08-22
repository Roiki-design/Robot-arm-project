/****************************************************************************
**
** Copyright (C) 2014 Alexander Rössler
** License: LGPL version 2.1
**
** This file is part of QtQuickVcp.
**
** All rights reserved. This program and the accompanying materials
** are made available under the terms of the GNU Lesser General Public License
** (LGPL) version 2.1 which accompanies this distribution, and is available at
** http://www.gnu.org/licenses/lgpl-2.1.html
**
** This library is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
** Lesser General Public License for more details.
**
** Contributors:
** Alexander Rössler @ The Cool Tool GmbH <mail DOT aroessler AT gmail DOT com>
**
****************************************************************************/
import QtQuick 2.12
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.12
import QtQuick.Window 2.0
import QtQuick.Controls.Imagine 2.12
import Machinekit.Controls 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Service 1.0


ServiceWindow {
    id: window
    visible: true
    width: 1280
    height: 800
    color: "black"
    title: applicationCore.applicationName + (d.machineName == "" ? "" :" - " +  d.machineName)

    readonly property color colorGlow: "#1d6d64"
    readonly property color colorWarning: "#d5232f"
    readonly property color colorMain: "#6affcd"
    readonly property color colorBright: "#ffffff"
    readonly property color colorLightGrey: "#888"
    readonly property color colorDarkGrey: "#333"

    QtObject {
        id: d
        readonly property string machineName: applicationCore.status.config.name
    }

    FontLoader {
        id: iconFont
        source: "icons/MaterialIcons-Regular.ttf"
    }

    Service {
        id: halrcompService
        type: "halrcomp"
    }

    Service {
        id: halrcmdService
        type: "halrcmd"
    }

    ApplicationCore {
        id: applicationCore
        notifications: applicationNotifications
        applicationName: "Robot-remote"
    }

    PathViewCore {
        id: pathViewCore
    }

    ApplicationToolBar {
        id: toolBar
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: window.height * 0.1
    }


    GridLayout {
        id: mainGrd
        columns: 2
        anchors.right: displayPanel.left
        anchors.rightMargin: 0
        anchors.left: toolBar.right
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0

        TabView {
            id: mainTab
            visible: true
            Layout.fillWidth: true
            tabPosition: 8
            Layout.fillHeight: true

            style: TabStyle{}
            JogControlTab { id: jogControlTab }
            GCodeTab { id: gCodeTab}
            //programTab {}
            SettingsTab { id: settingsTab}
          }


        TabView {
            id: secondaryTab
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            tabsVisible: true
            frameVisible: false
            visible: true
            style: TabStyle{}
            tabPosition: 8


            MdiTab { anchors.bottomMargin: 10}
        }



    }

    ApplicationRemoteFileDialog {
        id: applicationRemoteFileDialog
        width: window.width
        height: window.height
        fileDialog: applicationFileDialog
    }

    ApplicationFileDialog {
        id: applicationFileDialog
    }


    DisplayPanel {
        id: displayPanel
        x: 939
        width: 287
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: applicationProgressBar.top
        anchors.rightMargin: 54
        anchors.bottomMargin: 0
        anchors.topMargin: 8
        anchors.margins: Screen.pixelDensity

    }

    ApplicationProgressBar {
        id: applicationProgressBar
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: displayPanel.width
        anchors.margins: Screen.pixelDensity
    }

    ApplicationNotifications {
        id: applicationNotifications
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.margins: Screen.pixelDensity
        messageWidth: parent.width * 0.25
    }




}
















/*##^## Designer {
    D{i:4;anchors_height:300;anchors_width:360}D{i:16;anchors_width:256;anchors_x:970}
D{i:17;anchors_width:256;anchors_x:970}D{i:18;anchors_width:256;anchors_x:970}D{i:19;anchors_width:256;anchors_x:970}
D{i:20;anchors_width:256;anchors_x:970}D{i:21;anchors_width:256;anchors_x:970}
}
 ##^##*/
