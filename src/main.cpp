#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "config_manager.h"

int main(int argc, char* argv[]) {
    QCoreApplication::setApplicationName(QStringLiteral("xcmd-qt"));

    // hack
    ConfigManager();

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // detect whether debug build
#ifdef NDEBUG
    const bool isDebugBuild = false;
#else
    const bool isDebugBuild = true;
#endif

    engine.rootContext()->setContextProperty("isDebugBuild", isDebugBuild);

    const QUrl url(QStringLiteral("qrc:/qt/qml/xcmd-qt/src/Main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
        []() { QCoreApplication::exit(-1); }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}