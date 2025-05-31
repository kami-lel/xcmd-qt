import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {

    flags: Qt.Window | Qt.FramelessWindowHint
    width: 1920
    height: 1080
    visible: true
    color: "transparent"
    title: qsTr("Hello World")

    // show checkerboard for window size in debug build
    background: Rectangle {
        anchors.fill: parent
        color: "transparent"
        visible: isDebugBuild

        Image {
            anchors.fill: parent
            // hack use proper resource management
            source: "../assets/images/minecraft_missing_texture.png"
            fillMode: Image.Tile
            opacity: 0.2
        }
    }

    // HACK filler
    Text {
        anchors.centerIn: parent
        text: "Hello World"
        color: "blue"
        font.pointSize: 20
    }

}


