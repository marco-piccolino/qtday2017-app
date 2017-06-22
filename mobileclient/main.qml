import QtQuick 2.7
import QtQuick.Controls 2.0
import "qrc:/../entities" as E
import "qrc:/../repos" as R
import "qrc:/../usecases" as U

// main.qml
ApplicationWindow {
    E.Talks {
        Component.onCompleted: E.Entities.talks = this
        repo: R.TalksLocal3 {}
    }
    U.BrowseTalks {
        id: browse_talks // could create a register like for entities
    }
    visible: true
    width: 320
    height: 480

    header: ToolBar {
        width: parent.width
        Label {
            anchors.centerIn: parent
            text: "QtDay"
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: welcomeViewer
    }

    Component {
        id: welcomeViewer
        Page {
            Button {
                width: 180
                anchors.centerIn: parent
                text: "browse the talks"
                onClicked: browse_talks.run()
            }
        }
    }

    Component {
        id: talksViewer
        Page {
            ListView {
                anchors.fill: parent
                model: E.Entities.talks.list
                delegate: ItemDelegate {
                    width: parent.width
                    text: "%1: %2".arg(model.author).arg(model.title)
                }
            }
        }
    }

    Connections {
        id: router // in a real app, better use a state machine to abstract navigation
        target: browse_talks
        onSuccess: stackView.push(talksViewer)
    }
}
