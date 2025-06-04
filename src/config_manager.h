#ifndef CONFIG_MANAGER_H
#define CONFIG_MANAGER_H

#include <QJsonDocument>

class ConfigManager : public QJsonDocument {
 public:
  ConfigManager();
  ~ConfigManager();
};

#endif  // CONFIG_MANAGER_H