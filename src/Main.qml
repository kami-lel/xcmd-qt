import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    id: mainWindow

    // radius (center to vertext) of a hexgaon when enlarges/focused
    property int enlargedHexagonRadius: 500;

    flags: Qt.FramelessWindowHint | Qt.Window
    width: 1280
    height: 720
    color: "transparent"
    visible: true
    title: qsTr("Hello World")

    // when debug, render a purple to show windows range
    background: Rectangle {
        anchors.fill: parent
        color: "fuchsia"
        visible: isDebugBuild
        opacity: 0.2
    }

    TextPart {
        visible: false   // HACK
        anchors.centerIn: parent
        enlargedHexagonRadius: mainWindow.enlargedHexagonRadius
    }

    HexagonPart {
        visible: false   // HACK
        anchors.centerIn: parent
    }

    HexagonShape{
    }
}
