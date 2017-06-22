import QtQml 2.2
import "../entities"
//---
// BrowseTalks.qml
Object {
    signal success(var message)
    signal failure(var message)
    function run() {
        Entities.talks.readAll(); // Entities is a register
    }
    Connections { // normally use promise-like constructs
        target: Entities.talks
        onWasRead:
            if (Entities.talks.count > 0) {success({});}
            else {failure({});}
    }
}
//---
