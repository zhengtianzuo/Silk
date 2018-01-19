/*!
 *@file main.qml
 *@brief 主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0
import Qt.labs.platform 1.0

ApplicationWindow {
    visible: true
    width: 600
    height: 300
    title: qsTr("Silk Zip文件分割器")

    Column{
        spacing: 12
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.fill: parent

        ProgressBar {
            id: progressBar
            height: 24
            width: parent.width*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            value: 0.0
            padding: 2

            background: Rectangle {
                implicitWidth: parent.width*0.8
                implicitHeight: 6
                color: "#e6e6e6"
                radius: 3
            }

            contentItem: Item {
                implicitWidth: parent.width*0.8
                implicitHeight: 4

                Rectangle {
                    width: progressBar.visualPosition * parent.width
                    height: parent.height
                    radius: 2
                    color: "#17a81a"
                }
            }
        }

        Label{
            id: lblFileName
            height: 24
            width: parent.width*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            text: fileDialog.file
        }

        Row{
            height: 32
            width: parent.width*0.8
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: parent.width*0.8 - openBtn.width*2

            Button{
                id: openBtn
                height: 32
                width: 120
                text: qsTr("打开Zip文件")
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        fileDialog.open()
                    }
                }
            }

            Button{
                id: splitterBtn
                height: 32
                width: 120
                text: qsTr("分割Zip文件")
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        silkZipSplitter.splitterFile(fileDialog.file);
                    }
                }
            }
        }
    }
    FileDialog {
        id: fileDialog
        fileMode: FileDialog.OpenFile
        nameFilters: ["Zip文件 (*.zip)"]
        options :FileDialog.ReadOnly
    }

    Connections{
        target: silkZipSplitter
        ignoreUnknownSignals: true
        onSSetProgressMax:{
            progressBar.from = 0;
            progressBar.to = nMax;
        }
        onSSetProgressValue:{
            progressBar.value = nValue;
        }
    }
}
