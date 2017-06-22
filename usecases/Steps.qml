pragma Singleton
import QtTest 1.0
import QtQml 2.2

QtObject {
    property TestCase testcase
    function there_is_at_least_one_talk() {
        testcase.fail("implement")
    }
    function i_browse_talks() {
        testcase.fail("implement")
    }
    function i_am_given_a_list_of_talks() {
        testcase.fail("implement")
    }
    function the_list_of_talks_cointains_at_least_one_talk() {
        testcase.fail("implement")
    }
}
