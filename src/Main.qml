import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    id: mainWindow

    readonly property real sqrt3: 1.7320508075688772

    // radius (center to vertex) of a hexagon when enlarges/focused
    property int hexagonMaxRadius: 50
    property real hexagonScaling: 1.0

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

    HexagonShape{
        maxRadius: mainWindow.hexagonMaxRadius;
    }


}
