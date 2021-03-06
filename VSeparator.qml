import QtQuick 2.0
import QtQuick.Controls 2.0

Container {
    id: container

    property alias handle: handle
    property alias handleX: handle.x
    property color handleColor: "#888888"

    property Item separator: Rectangle{
        id: handle
        color: handleColor
        width: 4
        height: contentItem.height
        x: Math.round(contentItem.width/2 - width/2)
        y: 0
        z: 1
        MouseArea {
            id: handleMA
            anchors.fill: parent
            cursorShape: Qt.SizeHorCursor
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: Math.round(contentItem.width*0.1)
            drag.maximumX: Math.round(contentItem.width*0.9 - parent.width)
        }
    }

    // Set the initial states
    Component.onCompleted: {
        if (count === 2){
            // Inserting the separator
            insertItem(1, separator);

            // Make the items interact with the hanle
            //---------------------------------------
            // Left Item
            var leftItem = contentChildren[0];
            leftItem.x= 0
            leftItem.y= 0
            leftItem.height = contentItem.height
            leftItem.width = contentItem.width - (contentItem.width-Math.round(handleX+handle.width))
            leftItem.clip = true

            // Right Item
            var rightItem = contentChildren[2];
            rightItem.y = 0;
            rightItem.x = handleX+handle.width
            rightItem.height = contentItem.height
            rightItem.width = contentItem.width - Math.round(handleX+handle.width)
            rightItem.clip = true

        } else{
            console.error("Please insert 2 items only, more or less is not supported for the moument.")
        }
    }

    Binding {
          target: contentChildren[0]
          property: 'width'
          value: contentItem.width - (contentItem.width-Math.round(handleX+handle.width))
          when: handleMA.drag.active
      }
    Binding {
          target: contentChildren[2]
          property: 'x'
          value: handleX+handle.width
          when: handleMA.drag.active
      }
    Binding {
          target: contentChildren[2]
          property: 'width'
          value: contentItem.width - Math.round(handleX+handle.width)
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
