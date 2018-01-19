/*!
 *@file BaseButton.qml
 *@brief 自定义按钮
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

Button{
    property string imgEntered: "qrc:/images/ButtonHover.png"
    property string imgExited: "qrc:/images/ButtonNormal.png"
    property string imgPressed: "qrc:/images/ButtonPressed.png"
    property string txtText: qsTr("")

    signal sClicked()

    id: btn
    text: txtText
    font.family: "Microsoft YaHei"
    font.pixelSize: 15
    background: Image{
        id: img
        anchors.fill: parent
        source: imgExited
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: img.source = imgEntered
        onExited: img.source = imgExited
        onPressed: img.source = imgPressed
        onClicked: {
            emit: sClicked();
        }
    }
}
