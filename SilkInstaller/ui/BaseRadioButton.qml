/*!
 *@file BaseRadioButton.qml
 *@brief 自定义单选框
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
import QtQuick 2.7
import QtQuick.Controls 2.0

RadioButton {
    property string txtText: qsTr("")

	id: control
    text: txtText
    font.family: "Microsoft YaHei"
    font.pixelSize: 15
	indicator: Rectangle {
		implicitWidth: 18
		implicitHeight: 18
		x: control.leftPadding
		y: parent.height / 2 - height / 2
		radius: 9
		border.color: control.down ? "#148014" : "#21be2b"

		Rectangle {
			width: 10
			height: 10
			anchors.centerIn: parent
			radius: 4
			color: control.down ? "#148014" : "#21be2b"
			visible: control.checked
		}
	}

	contentItem: Text {
		text: control.text
		font: control.font
		opacity: enabled ? 1.0 : 0.3
		color: control.down ? "#148014" : "#21be2b"
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		leftPadding: control.indicator.width + control.spacing
	}
}

