import QtQuick 2.15

Item {
    id: hexagonPart

    focus: true

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.focus = true
            // BUG need to figure out how to select
            console.log("HexagonPart selected")
        }
    }
}
