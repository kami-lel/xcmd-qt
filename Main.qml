import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {

    flags: Qt.Window | Qt.FramelessWindowHint
    width: 640
    height: 480
    visible: true
    color: "transparent"
    title: qsTr("Hello World")

    background: Rectangle {
        color: "transparent"

        // shown a checkerboard for window size in debug build
        Image {
            anchors.fill: parent
            // hack use proper resource management
            source: "assets/images/minecraft_missing_texture.png"
            fillMode: Image.Tile
            visible: isDebugBuild
            opacity: 0.5
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
        color: "blue"
        font.pointSize: 20
    }
}

