// tst_browse_talks.qml
import QtQml 2.2
import QtTest 1.0
import "."
import "../entities" as E
import "../repos" as R

TestCase {
    name: "browse_talks" // test name; useful for output and AutoTest plugin

    property var usecases
    Component {
        id: usecasesC
        QtObject {  // usecase implementation references
            property var browse_talks: BrowseTalks {}

            property var browse_talks_success_spy: SignalSpy {
                target: usecases.browse_talks
                signalName: "success"
            }
        }
    }

    property var entities
    Component {
        id: entitiesC
        QtObject { // entity implementation references
            id: entities
            property var talks: E.Talks {
                Component.onCompleted: E.Entities.talks = this
                repo: R.TalksLocal3 {}
            }
            property var talksDataReadSpy: SignalSpy {
                target: entities.talks.repo
                signalName: "dataRead"
            }
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
    //---
    function test_browse_talks__none() {
        skip()
    }
}
