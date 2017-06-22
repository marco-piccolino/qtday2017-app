import QtQml 2.2
import QtTest 1.0
import "."

TestCase {
    name: "browse_talks" // test name; useful for output and AutoTest plugin

    property var usecases
    Component {
        id: usecasesC
        QtObject {
            property var browse_talks: BrowseTalks {} // usecase implementation reference
        }
    }

    function initTestCase() {Steps.testcase = this} // pass testcase env. to Steps
    function cleanupTestCase() {Steps.testcase = null}
    //---
    function init() { // called before each scenario
        usecases = usecasesC.createObject(this)
    }
    function cleanup() {
        usecases.destroy()
    }

    function test_browse_talks__one_or_more() {
        //Given
        Steps.there_is_at_least_one_talk()
        // When
        Steps.i_browse_talks()
        // Then
        Steps.i_am_given_a_list_of_talks()
        // And
        Steps.the_list_of_talks_cointains_at_least_one_talk()
    }
}
