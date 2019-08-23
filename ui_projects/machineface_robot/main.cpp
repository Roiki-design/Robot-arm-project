
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QLibraryInfo>
#include <QIcon>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>
#include <QQuickStyle>
#include <QQmlFileSelector>
#include <QFontDatabase>
#include <QDebug>

int main(int argc, char *argv[])
{

    QGuiApplication::setApplicationName("Automotive");
    QGuiApplication::setOrganizationName("QtProject");
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setAttribute(Qt::AA_UseHighDpiPixmaps);

    QGuiApplication app(argc, argv);

    QIcon::setThemeName("robot");
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));




    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("imports"));
    engine.addImportPath(QStringLiteral("assets:/imports"));
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QTranslator translator;
    if (translator.load(QLocale(), QLatin1String("machineface"),
                          QLatin1String("_"), QLibraryInfo::location(QLibraryInfo::TranslationsPath)))
    {
        QCoreApplication::installTranslator(&translator);
    }

    return app.exec();
}

