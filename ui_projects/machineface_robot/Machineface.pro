TEMPLATE = app
NAME = Machineface_robot

QT += qml quick widgets quickcontrols2
CONFIG += c++11
CONFIG += disable-desktop
SOURCES += main.cpp \
    documenthandler.cpp

QTPLUGIN += qtvirtualkeyboardplugin
RESOURCES += qml.qrc \
            qtquickcontrols2.conf

QML_FILES = $$PWD/$$NAME/*.qml
OTHER_FILES += $$QML_FILES

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

ios: {
    LIBS += -L$$PROTOBUF_LIB_PATH
    LIBS += -L$$ZEROMQ_LIB_PATH
    LIBS += -L$$LIBSODIUM_LIB_PATH
    LIBS += -lsodium -lzmq -lprotobuf
}

android: {
    LIBS += -lmachinetalk-protobuf
}

#TRANSLATIONS_PATH = $$PWD/translations
#TRANSLATIONS_OUT_PATH = $$PWD/$$NAME/translations
#include(translation.pri)

DISTFILES += \ \ \
    qtquickcontrols2.conf \
    texteditor/+touch/texteditor.html \
    texteditor/doc/images/qtquickcontrols2-texteditor-desktop.jpg \
    texteditor/doc/images/qtquickcontrols2-texteditor-touch.jpg \
    texteditor/doc/src/qtquickcontrols2-texteditor.qdoc \
    texteditor/fonts/fontello.ttf \
    texteditor/images/qt-logo.png \
    texteditor/qml/+touch/texteditor.qml \
    texteditor/qtquickcontrols2.conf

HEADERS += \
    documenthandler.h


