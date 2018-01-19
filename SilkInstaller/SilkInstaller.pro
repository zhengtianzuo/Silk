#-------------------------------------------------
#
# Copyright (C) 2003-2103 CamelSoft Corporation
#
#-------------------------------------------------

QT += qml quick widgets

CONFIG += c++11

TARGET = SilkPlatform

SOURCES += \
    $$PWD/src/main.cpp \
    $$PWD/src/SilkInstaller.cpp \
    $$PWD/src/documenthandler.cpp

HEADERS += \
    $$PWD/src/SilkInstaller.h \
    $$PWD/src/documenthandler.h

RESOURCES += $$PWD/qml.qrc
RESOURCES += $$PWD/qrc/qml1.qrc \
    $$PWD/qrc/qml2.qrc \
    $$PWD/qrc/qml3.qrc \
    $$PWD/qrc/qml4.qrc \
    $$PWD/qrc/qml5.qrc \
    $$PWD/qrc/qml6.qrc \
    $$PWD/qrc/qml7.qrc \
    $$PWD/qrc/qml8.qrc \
    $$PWD/qrc/qml9.qrc \
    $$PWD/qrc/qml10.qrc \
    $$PWD/qrc/qml11.qrc \
    $$PWD/qrc/qml12.qrc \
    $$PWD/qrc/qml13.qrc \
    $$PWD/qrc/qml14.qrc \
    $$PWD/qrc/qml15.qrc \
    $$PWD/qrc/qml16.qrc \
    $$PWD/qrc/qml17.qrc \
    $$PWD/qrc/qml18.qrc \
    $$PWD/qrc/qml19.qrc

LIBS+= -L$$PWD/quazip -lzlib

include(quazip/quazip.pri)
DEFINES+= QUAZIP_BUILD

win32{
    RC_FILE = SilkInstaller.rc
}
