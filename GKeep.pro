requires(qtConfig(accessibility))

TEMPLATE = app
TARGET = gkeep

HEADERS =
SOURCES = main.cpp

OTHER_FILES += ApplicationRoot.qml \
               BrowserWindow.qml

RESOURCES += resources.qrc

QT += qml quick webengine

qtHaveModule(widgets) {
    QT += widgets # QApplication is required to get native styling with QtQuickControls
}

INSTALLS += target
