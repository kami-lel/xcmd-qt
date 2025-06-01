import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    id: mainWindow

    flags: Qt.FramelessWindowHint | Qt.Window

    visible: true

    // hack maybe use fullscreen
    width: 1280
    height: 720

    // radius (center to vertext) of a hexgaon when enlarges/focused
    property int enlargedHexagonRadius: 500;


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
            opacity: 1.0
        }
    }

    TextPart {
        anchors.centerIn: parent
        enlargedHexagonRadius: mainWindow.enlargedHexagonRadius
    }

    HexagonPart {
        anchors.centerIn: parent
    }
}
