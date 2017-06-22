import QtQml 2.2
import "../entities"

Object {
    signal success(var message)
    signal failure(var message)
    function run() {
        Entities.talks.readAll();
    }
    Connections {
        target: Entities.talks
        ignoreUnknownSignals: true
        onWasRead:
            if (Entities.talks.count > 0) {
                success({});
            } else {
                failure({});
            }
    }
}
