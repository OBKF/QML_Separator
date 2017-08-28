import QtQuick 2.0
import QtQuick.Layouts 1.1


Item{
    id: container
    property alias handleY: handle.y
    property alias itemT: loaderT.sourceComponent
    property alias itemB: loaderB.sourceComponent
    property alias handle: handle
    property color backgroundColor: backgroundColor = "#fff"

    Item{
        id: topItem
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Layout.fillWidth: true
        x: 0
        y: 0
        height: container.height - (container.height-Math.round(handle.y+handle.height))
        Rectangle{
            anchors.fill: parent
            color: backgroundColor
            clip: true
            Layout.fillWidth: true
            Layout.preferredHeight: 4
            Loader { id: loaderT
                     anchors.fill: parent
            }
        }

    }
    Rectangle{
        id: handle
        color: "#888888"
        height: 6
        z: 1
        y: Math.round(container.height/2 - height/2)
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Layout.fillWidth: true
        Layout.preferredHeight: 4

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: Math.round(container.height*0.1)
            drag.maximumY: (container.height*0.9 - parent.height)
        }
    }
    Item{
        id: buttomItem
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Layout.fillWidth: true
        x: 0
        y: container.height-height
        height: container.height - Math.round(handle.y+handle.height)
        Rectangle{
            anchors.fill: parent
            color: backgroundColor
            Layout.fillWidth: true
            Layout.preferredHeight: 4
            Loader { id: loaderB
                     anchors.fill: parent
            }
        }
    }
}
