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
import QtGraphicalEffects 1.0
import documentHandler 1.0

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 600
    height: defaultMargin*5 + rowBtn.height + imgBack.height + colMore.height + btnStart.height + rowLicense.height
    title: qsTr("")
    flags: Qt.Window | Qt.FramelessWindowHint
    font.family: "Microsoft YaHei"
    font.pixelSize: 15
    Component.onCompleted: {
        edtPath.text = silkInstaller.cls_getAppPath();
        document.load("qrc:/LICENSE(CN).htm");
    }

    property int defaultMargin: 12
    property double progressStep: 1.0
    property bool isFinish: false

    function onChkMore(){
        if (chkMore.checked){
            colMore.height = 80;
            colMore.visible = true;
        }else{
            colMore.height = 0;
            colMore.visible = false;
        }
    }

    MouseArea{
        anchors.fill: parent
        property point clickPos: "0,0"
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            mainWindow.setX(mainWindow.x+delta.x)
            mainWindow.setY(mainWindow.y+delta.y)
        }
    }

    FolderDialog {
        id: folderDlg
        onAccepted: {
            var path = folderDlg.currentFolder.toString();
            path = path.replace(/^(file:\/{3})/,"");
            edtPath.text = path;
            silkInstaller.cls_setAppPath(path);
        }
    }

    Rectangle{
        id: rect
        color: "#148014"
        anchors.fill: parent
    }

    RectangularGlow {
        anchors.fill: rect
        glowRadius: 10
        spread: 0.0
        color: "white"
        cornerRadius: 10
    }

    Column{
        id: mainCol
        width: parent.width
        spacing: defaultMargin

        Row{
            id: rowBtn
            spacing: defaultMargin/2
            anchors.right: parent.right
            anchors.rightMargin: defaultMargin
            BaseButton{
                id: btnMin
                anchors.top: parent.top
                anchors.topMargin: defaultMargin
                height: 24
                width: 24
                imgEntered: "qrc:/images/min(3).png"
                imgExited: "qrc:/images/min.png"
                imgPressed: "qrc:/images/min(1).png"
                onSClicked: {
                    showMinimized();
                }
            }
            BaseButton{
                id: btnClose
                anchors.top: parent.top
                anchors.topMargin: defaultMargin
                height: 24
                width: 24
                imgEntered: "qrc:/images/close(3).png"
                imgExited: "qrc:/images/close.png"
                imgPressed: "qrc:/images/close(1).png"
                onSClicked: {
                    Qt.quit();
                }
            }
        }

        Image {
            id: imgBack
            height: 240
            width: parent.width*0.9
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images/back.jpg"

            Image {
                id: imgLogo
                anchors.centerIn: parent
                source: "qrc:/images/Logo.png"
            }

            QmlCircularProgress{
                id: cProgress
                visible: false
                anchors.centerIn: parent
                arcWidth: 16
                radius: 60
                interval: 1
                arcColor: "#148014"
                arcBackgroundColor: "#AAAAAA"
            }
        }


        Column{
            id: colMore
            height: 0
            width: parent.width
            spacing: defaultMargin
            visible: false

            Row{
                height: 32
                width: parent.width*0.9
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: defaultMargin/2

                Rectangle{
                    height: 32
                    width: parent.width - btnPath.width
                    border.color: "#148014"
                    border.width: 1

                    TextEdit{
                        id: edtPath
                        anchors.left: parent.left
                        anchors.leftMargin: 3
                        height: parent.height-2
                        width: parent.width-2
                        selectByKeyboard: true
                        selectByMouse: true
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                BaseButton{
                    id: btnPath
                    height: 32
                    width: 60
                    txtText: qsTr("浏览")
                    onSClicked: {
                        folderDlg.open();
                    }
                }
            }
            Row{
                height: 32
                width: parent.width*0.9
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: defaultMargin/2

                BaseCheckBox {
                    id: chkShort
                    height: 24
                    text: qsTr("生成快捷方式")
                    checked: true
                    onToggled:{

                    }
                }
                BaseCheckBox {
                    id: chkQuick
                    height: 24
                    text: qsTr("添加到快速启动栏")
                    checked: true
                    onToggled:{

                    }
                }
                BaseCheckBox {
                    id: chkAuto
                    height: 24
                    text: qsTr("开机自动启动")
                    checked: true
                    onToggled:{

                    }
                }
            }
        }

        BaseButton{
            id: btnStart
            height: 48
            width: 240
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 18
            txtText: qsTr("立即安装")
            onSClicked: {
                if (isFinish === false){
                    silkInstaller.cls_setAppPath(edtPath.text);
                    silkInstaller.cls_start();
                }else{
                    Qt.quit();
                }
            }
        }

        Row{
            id: rowLicense
            width: parent.width
            anchors.left: parent.left
            anchors.leftMargin: defaultMargin*2
            anchors.right: parent.right
            anchors.rightMargin: defaultMargin

            BaseCheckBox {
                id: chkLicense
                height: 24
                text: qsTr("阅读并同意")
                checked: true
                onToggled:{
                    btnStart.enabled = checked;
                }
            }

            BaseLinkText {
                id: btnLicense
                height: 24
                anchors.top: chkLicense.top
                anchors.topMargin: 2
                txtText: '<html></style><a>使用协议</a></html>'
                color: "blue"
                onSClicked: {
                    mainCol.visible = false;
                    recLicense.visible = true;
                    btnReturn.visible = true;
                }
            }

            Item{
                height: 24
                width: parent.width - chkLicense.width - btnLicense.width - chkMore.width - btnMore.width - defaultMargin
            }

            BaseCheckBox {
                id: chkMore
                height: 24
                width: 24
                imgChecked: "qrc:/images/down.png"
                imgUnchecked: "qrc:/images/up.png"
                onToggled:{
                    onChkMore();
                }
            }

            BaseLinkText {
                id: btnMore
                height: 24
                anchors.top: chkMore.top
                anchors.topMargin: 2
                text: '<html></style><a>自定义选项</a></html>'
                color: "blue"
                onSClicked: {
                    chkMore.checked = !chkMore.checked;
                    onChkMore();
                }
            }
        }
    }

    Rectangle{
        id: recLicense
        clip: true
        visible: false
        height: parent.height
        width: parent.width
        color: "#FFFFFF"
        Keys.onUpPressed: vbar.decrease()
        Keys.onDownPressed: vbar.increase()

        DocumentHandler {
            id: document
            onLoaded: {
                txtLicense.text = text
            }
        }

        TextArea{
            id: txtLicense
            height: contentHeight
            width: recLicense.width - vbar.width
            y: -vbar.position * txtLicense.height
            font.family: "Microsoft YaHei"
            font.pixelSize: 15
            readOnly: true
            selectByKeyboard: true
            selectByMouse: true
            textFormat: TextEdit.RichText
            wrapMode: TextEdit.WrapAnywhere

            MouseArea{
                anchors.fill: parent
                onWheel: {
                    if (wheel.angleDelta.y > 0) {
                        vbar.decrease();
                    }
                    else {
                        vbar.increase();
                    }
                }
                onClicked: {
                    txtLicense.forceActiveFocus();
                }
            }
        }
        ScrollBar {
            id: vbar
            hoverEnabled: true
            active: hovered || pressed
            orientation: Qt.Vertical
            size: recLicense.height / txtLicense.contentHeight
            width: 10
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }

    BaseButton{
        id: btnReturn
        visible: false
        height: 32
        width: 80
        anchors.top: parent.top
        anchors.topMargin: defaultMargin
        anchors.right: parent.right
        anchors.rightMargin: defaultMargin
        txtText: qsTr("返回")
        onSClicked: {
            mainCol.visible = true;
            recLicense.visible = false;
            btnReturn.visible = false
        }
    }


    MessageDialog {
        id: messageDialog
        visible: false
        title: qsTr("")
        text: qsTr("")
    }

    Connections{
        target: silkInstaller
        onSShowError:{
            messageDialog.title = qsTr("错误");
            messageDialog.text = strError;
            messageDialog.visible = true;
        }
        onSShowMaxProgress:{
            progressStep = 360/nMax;
        }
        onSShowProgress:{
            cProgress.progress = progressStep*value;
            cProgress.requestPaint();
        }
        onSStart:{
            imgLogo.source = "qrc:/images/SilkPlatform.png";
            imgLogo.opacity = 0.3;
            rowLicense.visible = false;
            btnStart.visible = false;
            btnClose.visible = false;
            cProgress.visible = true;
            chkMore.checked = false;
            onChkMore();
        }
        onSFinish:{
            imgLogo.opacity = 1.0;
            cProgress.visible = false;
            btnStart.txtText = qsTr("完成");
            btnStart.visible = true;
            isFinish = true;
        }
    }

}
