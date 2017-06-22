pragma Singleton
import QtTest 1.0
import QtQml 2.2
//---
QtObject {
    property TestCase testcase
    function there_is_at_least_one_talk() {
        testcase.verify(testcase.repositories.talks.count > 0)
    }
    function i_browse_talks() {
        testcase.usecases.actions.browse_talks()
        testcase.usecases.browse_talks.success.wait()
    }
    function i_am_given_a_list_of_talks() {
        testcase.verify(testcase.entities.talks.list)
    }
    function the_list_of_talks_cointains_at_least_one_talk() {
        testcase.verify(testcase.entities.talks.count > 0)
    }
}
