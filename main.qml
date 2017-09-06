import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQml 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    SwipeView {
        id: swipeView
        anchors.fill: parent
//        VSeparator{
//            Rectangle{
//                color: "#f00"
//                Text {
//                    anchors.fill: parent
//                    text: "Page 1"
//                }
//            }

//            Rectangle{
//                color: "#0f0"
//                Text {
//                    anchors.fill: parent
//                    text: "Page 2"
//                }
//            }
//        }
//        HSeparator{
//            Rectangle{
//                color: "#f00"
//                Text {
//                    anchors.fill: parent
//                    text: "Page 1"
//                }
//            }

//            Rectangle{
//                color: "#0f0"
//                Text {
//                    anchors.fill: parent
//                    text: "Page 2"
//                }
//            }
//        }

        HSeparator{
            Page {
                Label {
                    id: something
                    text: qsTr("Second page")
                    anchors.centerIn: parent
                }
            }
            Page {
                Label {
                    text: qsTr("Second page")
                    anchors.centerIn: parent
                }
            }
        }

        VSeparator{
            handleColor: "red"
            Page {
                Label {
                    id: ooo
                    text: qsTr("Second page")
                    anchors.centerIn: parent
                }
            }
            Page {
                Label {
                    text: qsTr("Second page")
                    anchors.centerIn: parent
                }
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
            onClicked: ooo.text = "this is cool thing"
        }
        TabButton {
            text: qsTr("Second")
        }
    }
}
