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

        Image {
            anchors.fill: parent
            source: "qrc:/assets/images/minecraft_missing_texture.png"
            fillMode: Image.Tile
            visible: isDebugBuild
        }
    }

    Text {
        anchors.centerIn: parent
        text: "Hello World"
        color: "blue"
        font.pointSize: 20
    }
}

