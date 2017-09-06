import QtQuick 2.0
import QtQuick.Controls 2.0

Container {
    id: container

    property alias handle: handle
    property alias handleY: handle.y
    property color handleColor: "#888888"

    property Item separator: Rectangle{
        id: handle
        color: handleColor
        width: contentItem.width
        height: 4
        x: 0
        y: Math.round(contentItem.height/2 - height/2)
        z: 1
        MouseArea {
            id: handleMA
            anchors.fill: parent
            cursorShape: Qt.SizeVerCursor
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: Math.round(contentItem.height*0.1)
            drag.maximumY: Math.round(contentItem.height*0.9 - parent.height)
        }
    }

    // Set the initial states
    Component.onCompleted: {
        if (count === 2){
            // Inserting the separator
            insertItem(1, separator);

            // Make the items interact with the hanle
            //---------------------------------------
            // Top Item
            var topItem = contentChildren[0];
            topItem.x= 0
            topItem.y= 0
            topItem.width = contentItem.width
            topItem.height = contentItem.height - (contentItem.height-Math.round(handleY+handle.height))
            topItem.clip = true

            // Bottom Item
            var bottomItem = contentChildren[2];
            bottomItem.x = 0;
            bottomItem.y = handleY+handle.height
            bottomItem.width = contentItem.width
            bottomItem.height = contentItem.height - Math.round(handleY+handle.height)
            bottomItem.clip = true
        } else{
            console.error("Please insert 2 items only, more or less is not supported for the moument.")
        }
    }

    Binding {
          target: contentChildren[0]
          property: 'height'
          value: contentItem.height - (contentItem.height-Math.round(handleY+handle.height))
          when: handleMA.drag.active
      }
    Binding {
          target: contentChildren[2]
          property: 'y'
          value: handleY+handle.height
          when: handleMA.drag.active
      }
    Binding {
          target: contentChildren[2]
          property: 'height'
          value: contentItem.height - Math.round(handleY+handle.height)
          when: handleMA.drag.active
      }

    contentItem: Control {
        spacing: 10
        padding: 10
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        anchors.fill: parent
    }
}
