// entities/Talks.qml
import QtQml 2.2
import QtQml.Models 2.2

Object { // patched QtObject; accepts children types
    readonly property alias count: list_d.count
    readonly property alias list: list_d
    property var repo // interface for data repository
    signal wasRead(var message)
    function readAll() {
        if (repo) repo.readData()
    }
    Connections {
        target: repo
        ignoreUnknownSignals: true
        onDataRead: {
            for (var i=0;i<records.length;i++) {
                list_d.append(records[i]);
                wasRead({});
            }
        }
    }
    Object {
        id: d
        ListModel { // simple implementation
            id: list_d
        }
    }
}
