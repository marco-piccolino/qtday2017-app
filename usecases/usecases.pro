TEMPLATE = app
TARGET = tst_usecases
CONFIG += warn_on qmltestcase
SOURCES += \
    tst_usecases.cpp

DISTFILES += \
    tst_browse_talks.qml \
    Steps.qml \
    qmldir

include(usecases.pri)
include(../entities/entities.pri)
include(../repos/repos.pri)
