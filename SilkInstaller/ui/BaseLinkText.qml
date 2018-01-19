/*!
 *@file BaseLinkText.qml
 *@brief 自定义超链接
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

Text {
    property string txtText: qsTr("")

    signal sClicked()

    id: text
    text: txtText
    font.family: "Microsoft YaHei"
    font.pixelSize: 15
    MouseArea {
        anchors.fill: parent;
        hoverEnabled: true;
        cursorShape:
            (containsMouse? Qt.PointingHandCursor: Qt.ArrowCursor);
        onClicked: {
            emit: sClicked();
        }
    }
}
