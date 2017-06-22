pragma Singleton
import QtTest 1.0
import QtQml 2.2

QtObject {
    property TestCase testcase
    function there_is_at_least_one_talk() {
        testcase.verify(testcase.entities.talks.count > 0)
    }
    function i_browse_talks() {
        testcase.usecases.actions.browse_talks()
        testcase.usecases.browse_talks.success.wait()
    }
    function i_am_given_a_list_of_talks() {
        for (var i=0;i<testcase.entities.talks.count;i++) {
            testcase.verify(testcase.entities.talks[i].title !== "")
            // ...
        }
    }
    function the_list_of_talks_cointains_at_least_one_talk() {
        testcase.fail("implement")
    }
}
