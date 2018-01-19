/*!
 *@file SilkInstaller.h
 *@brief Silk安装器
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QObject>
#include <QStandardPaths>
#include <QThread>
#include <QSettings>

//!@brief 注册表字段
#ifdef Q_OS_WIN32
const QString strUninstall =
    "HKEY_LOCAL_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\";
const QString strPublisher = "Publisher";
const QString strDisplayName = "DisplayName";
const QString strDisplayIcon = "DisplayIcon";
const QString strDisplayVersion = "DisplayVersion";
const QString strInstallLocation = "InstallLocation";
const QString strUninstallString = "UninstallString";
#endif

class SilkInstallerThread : public QThread
{
    Q_OBJECT
public:
    void Cls_subInit(QString strAppPath);

public slots:
    void run();

signals:
    void sShowError(QString strError);
    void sShowMaxProgress(int nMax);
    void sShowProgress(int value);
    void sStart();
    void sFinish();

private:
    bool Sub_funExtractFile(QString strInFile, QString strOutFile);
    bool Sub_funExtractDir(QString strInFile, QString strOutPath);
    bool Sub_fubExtractZipFile(QString strInFile, QString strInFilePath, QString strOutPath);
    QString getRegValue(QString &strPath, QString strItemName);
    void setRegValue(QString strPath, QString strItemName, QString strItemData);
    void delRegValue(QString strPath, QString strItemName);

    QString m_strAppPath;
};

class SilkInstaller : public QObject
{
    Q_OBJECT
public:
    SilkInstaller();
    Q_INVOKABLE QString cls_getAppPath();
    Q_INVOKABLE void cls_start();
    Q_INVOKABLE void cls_setAppPath(QString strAppPath);

signals:
    void sShowError(QString strError);
    void sShowMaxProgress(int nMax);
    void sShowProgress(int value);
    void sStart();
    void sFinish();

private:
    QString m_strAppPath;
    SilkInstallerThread *m_pThread;
};
