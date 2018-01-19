/*!
 *@file main.cpp
 *@brief 程序主文件
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "SilkInstaller.h"
#include "documenthandler.h"

int main(int argc, char *argv[])
{
    QApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    SilkInstaller silkInstaller;
    engine.rootContext()->setContextProperty("silkInstaller", &silkInstaller);
    qmlRegisterType<DocumentHandler>("documentHandler", 1, 0, "DocumentHandler");
    engine.load(QUrl(QStringLiteral("qrc:/ui/main.qml")));
    return app.exec();
}
