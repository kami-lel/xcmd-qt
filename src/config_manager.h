#ifndef CONFIG_MANAGER_H
#define CONFIG_MANAGER_H

#include <QJsonDocument>

class ConfigManager : public QJsonDocument {
    public:
    ConfigManager();

    private:
    void copyDefaultConfigFileTo(const QString &configPath);
};

#endif  // CONFIG_MANAGER_H