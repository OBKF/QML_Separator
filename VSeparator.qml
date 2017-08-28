import QtQuick 2.0
import QtQuick.Layouts 1.1


Item{
    id: container
    property alias handleY: handle.y
    property alias itemL: loaderL.sourceComponent
    property alias itemR: loaderR.sourceComponent
    property alias handle: handle
    property color backgroundColor: "#fff"
    property color handleColor: "#888888"

    Item{
        id: leftItem
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Layout.fillHeight: true
        x: 0
        y: 0
        width: container.width - (container.width-Math.round(handle.x+handle.width))
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Rectangle{
            anchors.fill: parent
            color: backgroundColor
            clip: true
            Loader { id: loaderL
                anchors.fill: parent
            }
        }
    }

    Rectangle{
        id: handle
        color: handleColor
        width: 4
        z: 1
        x: Math.round(container.width/2 - width/2)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        Layout.fillHeight: true
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.SizeHorCursor
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: Math.round(container.width*0.1)
            drag.maximumX: Math.round(container.width*0.9 - parent.width)
        }
    }

    Item{
        id: rightItem
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Layout.fillHeight: true
        width: container.width - Math.round(handle.x+handle.width)
        anchors.right: parent.right
        anchors.rightMargin: 0
        Rectangle{
            anchors.fill: parent
            color: backgroundColor
            clip: true
            Loader { id: loaderR
                anchors.fill: parent
            }
        }
    }
}
