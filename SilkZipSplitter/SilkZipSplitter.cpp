/*!
 *@file SilkZipSplitter.cpp
 *@brief Silk Zip文件分割器
 *@version 1.0
 *@section LICENSE Copyright (C) 2003-2103 CamelSoft Corporation
 *@author zhengtianzuo
*/
#include "SilkZipSplitter.h"
#include <QFile>
#include <QFileInfo>
#include <QtCore/qmath.h>
#include <QVariant>

SilkZipSplitter::SilkZipSplitter()
{
    connect(&m_splitterThread, SIGNAL(sSetProgressValue(int)), this, SLOT(onsSetProgressValue(int)));
}

void SilkZipSplitter::splitterFile(QString strZipFile)
{
    strZipFile.replace("file:///", "");
    QFileInfo fileInfo(strZipFile);
    if (fileInfo.exists() != true) return;
    int nMax = qCeil(fileInfo.size() / intPakageSize);
    emit sSetProgressMax(nMax);
    m_splitterThread.setThread(strZipFile);
    m_splitterThread.start();
}

void SilkZipSplitter::onsSetProgressValue(int nValue)
{
    emit sSetProgressValue(nValue);
}

void SplitterThread::setThread(QString strZipFile)
{
    m_strZipFile = strZipFile;
}

void SplitterThread::run()
{
    int nIndex = 1;
    while(splitter(m_strZipFile, nIndex))
    {
        nIndex++;
        emit sSetProgressValue(nIndex);
    }
}

bool SplitterThread::splitter(QString strZipFile, int nIndex)
{
    QFile infile(strZipFile);
    if (!infile.open(QIODevice::ReadOnly))
    {
        return(false);
    }
    infile.seek((nIndex-1)*intPakageSize);
    QByteArray data = infile.read(intPakageSize);
    if (data.size() <= 0)
    {
        return(false);
    }
    QString outFileName = strZipFile.left(strZipFile.length() - 2) + QString::number(nIndex).sprintf("%02d",nIndex);
    QFile outfile(outFileName);
    outfile.open(QIODevice::WriteOnly);
    outfile.write(data);
    infile.close();
    outfile.close();
    return(true);
}
