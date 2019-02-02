#ifndef QT_NO_WIDGETS
#include <QtWidgets/QApplication>
typedef QApplication Application;
#else
#include <QtGui/QGuiApplication>
typedef QGuiApplication Application;
#endif
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QtWebEngine/qtwebengineglobal.h>
#include <QIcon>

static QUrl startupUrl()
{
    return QUrl(QStringLiteral("https://keep.google.com"));
}

int main(int argc, char **argv)
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    Application app(argc, argv);

    QtWebEngine::initialize();

    QQmlApplicationEngine appEngine;
    appEngine.load(QUrl("qrc:/ApplicationRoot.qml"));
    QMetaObject::invokeMethod(appEngine.rootObjects().first(), "load", Q_ARG(QVariant, startupUrl()));

    return app.exec();
}
