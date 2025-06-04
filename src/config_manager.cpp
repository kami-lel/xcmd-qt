
#include "config_manager.h"

#include <QCoreApplication>
#include <QDir>
#include <QFile>
#include <QStandardPaths>

ConfigManager::ConfigManager() {
    // generate path to find config.json
    QString configPath = QDir::toNativeSeparators(
        QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation)
        + QDir::separator() + "config.json");

#ifndef NDEBUG
    qDebug() << "ConfigManager:\tconfig file path:" << configPath;
#endif  // NDEBUG

    // create a default config.json if non existent
    if (!QFile::exists(configPath)) {
        copyDefaultConfigFileTo(configPath);
    }
}

void ConfigManager::copyDefaultConfigFileTo(const QString &configPath) {
    QFile defaultConfigFile(":/assets/config.default.json");
    // BUG can not create file

    if (defaultConfigFile.open(QIODevice::ReadOnly)) {
        // make sure folder exist
        QDir().mkpath(QFileInfo(configPath).absolutePath());
        QFile outFile(configPath);

        if (outFile.open(QIODevice::WriteOnly)) {
            outFile.write(defaultConfigFile.readAll());
            outFile.close();
        }
        defaultConfigFile.close();
    }
}