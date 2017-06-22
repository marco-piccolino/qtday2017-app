QT += qml quick

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc

QML_IMPORT_PATH += $$PWD/../usecases
include(../usecases/usecases.pri)
include(../entities/entities.pri)
include(../repos/repos.pri)
