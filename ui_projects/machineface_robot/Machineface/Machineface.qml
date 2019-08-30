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
import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls.Imagine 2.12
import Machinekit.Controls 1.0
import Machinekit.Application 1.0
import Machinekit.Application.Controls 1.0
import Machinekit.PathView 1.0
import Machinekit.Service 1.0


ServiceWindow {
    id: window
    visible: true
    width: 1720
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

    ApplicationProgressBar {
        id: applicationProgressBar
        x: 1516
        y: 771
        width: 200
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: Screen.pixelDensity
    }

    ApplicationNotifications {
        id: applicationNotifications
        x: 1716
        y: 4
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.margins: Screen.pixelDensity
        messageWidth: parent.width * 0.25
    }
    ApplicationToolBar {
        id: toolBar
        width: 80
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible: true


    }

    GridLayout {
        id: mainGrid
        columns: 50
        rows: 50
        anchors.fill: parent
        anchors.leftMargin: 80



        property double colMulti : mainGrid.width / mainGrid.columns
        property double rowMulti : mainGrid.height / mainGrid.rows
        visible: true

        function prefWidth(item){
            return colMulti * item.Layout.columnSpan
        }
        function prefHeight(item){
            return rowMulti * item.Layout.rowSpan

        }


        Rectangle{
            id: tabContainer
            Layout.columnSpan: 38
            color: "transparent"
            Layout.rowSpan: 50
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: mainGrid.prefWidth(this)
            Layout.preferredHeight: mainGrid.prefHeight(this)


            TabView {
                id: mainTab
                tabsVisible: true
                anchors.fill: parent

                visible: true

                tabPosition: 8


                style: TabStyle{}

                MdiTab { anchors.bottomMargin: 10}

                SettingsTab { id: settingsTab}

                PreviewTab{}

                GCodeTab { id: gCodeTab}

                JogControlTab { id: jogControlTab }
                //ProgramTab {}
            }





        }

        Rectangle{
            id: displayPanelRec
            Layout.columnSpan: 12
            Layout.rowSpan: 50
            color: "transparent"
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: mainGrid.prefWidth(this)
            Layout.preferredHeight: mainGrid.prefHeight(this)



            DisplayPanel {
                id: displayPanel

            }



        }









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

    statusBar: StatusBar{}






    ApplicationRemoteFileDialog {
        id: applicationRemoteFileDialog
        width: window.width
        height: window.height
        fileDialog: applicationFileDialog
    }

    ApplicationFileDialog {
        id: applicationFileDialog
    }











}

























/*##^## Designer {
    D{i:6;anchors_height:800;anchors_width:80;anchors_y:0}D{i:18;anchors_height:300;anchors_width:360}
D{i:20;anchors_width:256;anchors_x:970}D{i:22;anchors_width:256;anchors_x:970}D{i:21;anchors_width:256;anchors_x:970}
}
 ##^##*/
