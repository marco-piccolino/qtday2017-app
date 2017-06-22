import QtQml 2.2
import QtTest 1.0
import "."

TestCase {
    name: "browse_talks"

    property var browse_talks
    Component {
        id: browseTalksC
        BrowseTalks {}
    }

    function initTestCase() {Steps.testcase = this}
    function cleanupTestCase() {Steps.testcase = null}

    function init() {
        browse_talks = browseTalksC.createObject()
    }
    function cleanup() {
        browse_talks.destroy()
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
