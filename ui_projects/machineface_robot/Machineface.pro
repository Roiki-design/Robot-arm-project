TEMPLATE = app
NAME = Machineface_robot

QT += qml quick widgets quickcontrols2
CONFIG += c++11
CONFIG += disable-desktop
SOURCES += main.cpp

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


HEADERS +=


