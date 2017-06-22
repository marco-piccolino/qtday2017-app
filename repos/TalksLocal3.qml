// repos/TalksLocal3.qml
import QtQml 2.2

QtObject {
    signal dataRead(var records)
    function readData() {
        dataRead([
                     {"title":"From Now to Qt 6 -
                      The Current Roadmap of Qt",
                         "author":"Artem Sidyakin"},
                     {"title":"Qt Quick Controls 2:
                      gli strumenti giusti per le interfacce embedded",
                         "author":"Luca Ottaviano"},
                     {"title":"Case Study:
                     Starting with QT - dall'idea al prodotto",
                         "author":"Edoardo Slaviero"}
                 ]);
    }
}
