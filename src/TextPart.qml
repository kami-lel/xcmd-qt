import QtQuick
import QtQuick.Controls


Item {
    id:textPart

    property int enlargedHexagonRadius: -1;

    focus: true

    Text {  // HACK filler
        anchors.centerIn: parent
        text: "Hello World"
        color: "blue"
        font.pointSize: 20
    }

    TextField {
        width: 200
        placeholderText: "Enter your name"
        text: parent.enlargedHexagonRadius.toString()
    }
}
