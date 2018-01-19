/*!
 *@file SilkInstaller.cpp
 *@brief Silk安装器
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "SilkInstaller.h"
#include "quazip/JlCompress.h"
#include <QCoreApplication>
#include <QFileInfo>
#include <QDir>
#include <QDebug>

SilkInstaller::SilkInstaller():
    m_strAppPath("")
{
    
}

QString SilkInstaller::cls_getAppPath()
{
    m_strAppPath = QStandardPaths::standardLocations(QStandardPaths::ConfigLocation)[0] + "/";
    return(m_strAppPath);
}

void SilkInstaller::cls_setAppPath(QString strAppPath)
{
    m_strAppPath = strAppPath + "/";
}

void SilkInstaller::cls_start()
{
    //判断文件夹是否有效
    if (m_strAppPath.length() < 2)
    {
        emit sShowError(QStringLiteral("请输入有效的文件路径."));
        return;
    }
    QDir appDir(m_strAppPath);
    if (appDir.exists() != true)
    {
        appDir.mkpath(m_strAppPath);
    }
    QFileInfo appPath(m_strAppPath);
    if (appPath.isDir() != true)
    {
        emit sShowError(QStringLiteral("请输入有效的文件路径."));
        return;
    }
    if (!m_strAppPath.endsWith("/") && !m_strAppPath.endsWith("\\"))
    {
        m_strAppPath += "/";
    }

    m_pThread = new SilkInstallerThread();
    m_pThread->Cls_subInit(m_strAppPath);
    QObject::connect(m_pThread, SIGNAL(sShowError(QString)),
                         this, SIGNAL(sShowError(QString)));
    QObject::connect(m_pThread, SIGNAL(sShowMaxProgress(int)),
                         this, SIGNAL(sShowMaxProgress(int)));
    QObject::connect(m_pThread, SIGNAL(sShowProgress(int)),
                         this, SIGNAL(sShowProgress(int)));
    QObject::connect(m_pThread, SIGNAL(sStart()),
                         this, SIGNAL(sStart()));
    QObject::connect(m_pThread, SIGNAL(sFinish()),
                         this, SIGNAL(sFinish()));
    m_pThread->start();
    emit sStart();
}

void SilkInstallerThread::Cls_subInit(QString strAppPath)
{
    m_strAppPath = strAppPath;
}

void SilkInstallerThread::run()
{
    //解压文件
    QString strInFileName = QStringLiteral(":/release.z01");
    QString strOutFileName = QCoreApplication::applicationDirPath() + QStringLiteral("/release.zip");
    int index = 1;
    while(Sub_funExtractFile(strInFileName, strOutFileName))
    {
        index++;
        QString strIndex = QString::number(index).sprintf("%02d",index);
        strInFileName = QStringLiteral(":/release.z") + strIndex;
    }

    bool bRet = Sub_funExtractDir(strOutFileName, m_strAppPath);
    if (bRet != true)
    {
        emit sShowError(QStringLiteral("文件解压错误."));
    }
    QFile infile(strOutFileName);
    infile.remove();

#ifdef Q_OS_WIN32
    //写入卸载信息
    QString strApp = "SilkPlatform";
    QString strAppName = QStringLiteral("丝绸");
    QString strAppIcon = m_strAppPath + "SilkPlatform.exe";
    QString strAppVersion = "v1.0.0.0";

    QString sUninstall(strUninstall);
    sUninstall += strApp;
    setRegValue(sUninstall, strDisplayName, strAppName);
    setRegValue(sUninstall, strDisplayIcon, strAppIcon);
    setRegValue(sUninstall, strDisplayVersion, strAppVersion);
    setRegValue(sUninstall, strPublisher, "zhengtianzuo");
    setRegValue(sUninstall, strUninstallString, strAppIcon);

    //建立桌面快捷方式
    QString strAppPath = m_strAppPath + "SilkPlatform.exe";
    QString strDesktopLink = QStandardPaths::writableLocation(QStandardPaths::DesktopLocation) + "/";
    strDesktopLink += QStringLiteral("丝绸.lnk");
    QFile fApp(strAppPath);
    fApp.link(strDesktopLink);

    //建立开始菜单快捷方式
    QString strMenuLink = QStandardPaths::writableLocation(QStandardPaths::ApplicationsLocation) + "/";
    strMenuLink += "CamelSoft/Silk/";
    QDir pathDir;
    pathDir.mkpath(strMenuLink);
    strMenuLink += QStringLiteral("丝绸.lnk");
    fApp.link(strMenuLink);
#endif

    emit sFinish();
}

#ifdef Q_OS_WIN32
//获取注册表
QString SilkInstallerThread::getRegValue(
    QString &strPath, QString strItemName)
{
    QSettings reg(strPath, QSettings::NativeFormat);
    return (reg.value(strItemName).toString());
}

//写入注册表
void SilkInstallerThread::setRegValue(
    QString strPath, QString strItemName, QString strItemData)
{
    QSettings reg(strPath, QSettings::NativeFormat);
    reg.setValue(strItemName, strItemData);
}

//删除注册表
void SilkInstallerThread::delRegValue(
    QString strPath, QString strItemName)
{
    QSettings reg(strPath, QSettings::NativeFormat);
    if (strItemName != nullptr)
    {
        reg.remove(strItemName);
    }
    else
    {
        reg.remove(strPath);
    }
}
#endif

bool SilkInstallerThread::Sub_funExtractFile(QString strInFile, QString strOutFile)
{
    QFile infile(strInFile);
    if (!infile.open(QIODevice::ReadOnly))
    {
        return(false);
    }
    QByteArray data = infile.readAll();
    QFile outfile(strOutFile);
    if (!outfile.open(QIODevice::WriteOnly | QIODevice::Append))
    {
        return(false);
    }
    outfile.write(data);
    infile.close();
    outfile.close();
    return(true);
}

bool SilkInstallerThread::Sub_funExtractDir(QString strInFile, QString strOutPath)
{
    QuaZip zipInFile(strInFile);
    if (!zipInFile.open(QuaZip::mdUnzip)) {return(false);}

    int nFileCount = zipInFile.getEntriesCount();
    sShowMaxProgress(nFileCount);

    int nFileProgress = 0;
    bool hasFile = zipInFile.goToFirstFile();
    while(hasFile)
    {
        bool bRet = Sub_fubExtractZipFile(zipInFile.getZipName(), zipInFile.getCurrentFileName(), strOutPath);
        if (bRet != true) return(false);
        nFileProgress++;
        sShowProgress(nFileProgress);
        bRet = zipInFile.goToNextFile();
        if (bRet != true) break;
    }
    return(true);
}

bool SilkInstallerThread::Sub_fubExtractZipFile(QString strInFile, QString strInFilePath, QString strOutPath)
{
    QuaZipFile infile(strInFile, strInFilePath);
    if (!infile.open(QIODevice::ReadOnly))
    {
        return(false);
    }
    QByteArray data = infile.readAll();
    QString outPath = strOutPath + strInFilePath;
    if (outPath.endsWith("/") == true)
    {
        QDir appDir(outPath);
        if (appDir.exists() != true)
        {
            appDir.mkpath(outPath);
        }
        return(true);
    }
    QFile outfile(outPath);
    if (!outfile.open(QIODevice::WriteOnly | QIODevice::Append))
    {
        return(false);
    }
    outfile.write(data);
    infile.close();
    outfile.close();
    return(true);
}
