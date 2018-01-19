/*!
 *@file SilkZipSplitter.h
 *@brief Silk Zip文件分割器
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#pragma once
#include <QObject>
#include <QThread>

const int intPakageSize = 3*1024*1024;

class SplitterThread : public QThread
{
    Q_OBJECT
public:
    void setThread(QString strZipFile);

protected:
    void run();

private:
    bool splitter(QString strZipFile, int nIndex);
    QString m_strZipFile;

signals:
    void sSetProgressValue(int nValue);
};

class SilkZipSplitter : public QObject
{
    Q_OBJECT
public:
    SilkZipSplitter();
    Q_INVOKABLE void splitterFile(QString strZipFile);

public slots:
    void onsSetProgressValue(int nValue);

private:
    SplitterThread m_splitterThread;

signals:
    void sSetProgressMax(int nMax);
    void sSetProgressValue(int nValue);
};
