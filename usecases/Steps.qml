// usecases/Steps.qml
pragma Singleton
import QtTest 1.0
import QtQml 2.2
//---
QtObject {
    property TestCase testcase
    property var entities: testcase ? testcase.entities : null
    property var usecases: testcase ? testcase.usecases : null
    function there_is_at_least_one_talk() {
        var dataRead = entities.talksDataReadSpy;
        entities.talks.repo.readData();
        dataRead.wait();
        var records = dataRead.signalArguments[0][0];
        testcase.verify(records.length > 0);
    }
    function i_browse_talks() {
        usecases.actions.browse_talks()
        usecases.browse_talks.successSignal.wait()
    }
    function i_am_given_a_list_of_talks() {
        testcase.verify(entities.talks.list)
    }
    function the_list_of_talks_cointains_at_least_one_talk() {
        testcase.verify(entities.talks.count > 0)
    }
}
