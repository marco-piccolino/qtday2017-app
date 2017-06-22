import QtQml 2.2
import QtTest 1.0
import "."
import "../entities" as E

TestCase {
    name: "browse_talks" // test name; useful for output and AutoTest plugin

    property var usecases
    Component {
        id: usecasesC
        QtObject {  // usecase implementation references
            property var browse_talks: BrowseTalks {}
        }
    }

    property var entities
    Component {
        id: entitiesC
        QtObject { // entity implementation references
            property var talks: E.Talks {}
        }
    }

    function initTestCase() {Steps.testcase = this} // pass testcase env. to Steps
    function cleanupTestCase() {Steps.testcase = null}
    //---
    function init() { // called before each scenario
        entities = entitiesC.createObject(this);
        usecases = usecasesC.createObject(this);
    }
    function cleanup() {
        usecases.destroy();
        entities.destroy();
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
