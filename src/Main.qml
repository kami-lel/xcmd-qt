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

    // render a purple rectangle when in debug mode to show window range
    background: Rectangle {
        anchors.fill: parent
        color: "fuchsia"
        visible: isDebugBuild
        opacity: 0.2
    }

    // hack animation for demo scaling, animate whenever hexagonScaling changes
    HexagonShape {
        maxRadius: mainWindow.hexagonMaxRadius
        scaling: mainWindow.hexagonScaling
        anchors.horizontalCenterOffset: mainWindow.hexagonMaxRadius * 4
        anchors.verticalCenterOffset: mainWindow.hexagonMaxRadius * 4
    }

    HexagonShape {
        maxRadius: mainWindow.hexagonMaxRadius
        scaling: mainWindow.hexagonScaling
        anchors.horizontalCenterOffset: mainWindow.hexagonMaxRadius * 2
    }

    // Search box container with shape shift
    SearchboxContainer {
        maxRadius: mainWindow.hexagonMaxRadius
        shapeShift: mainWindow.hexagonScaling
    }

    // animate hexagonScaling with a continuous linear number animation
    Behavior on hexagonScaling {
        NumberAnimation {
            from: 0.0
            to: 1.0
            duration: 3000  // 5 seconds
            loops: Animation.Infinite
            easing.type: Easing.Linear
        }
    }

    Component.onCompleted: {
        // start the ping-pong scaling animation
        mainWindow.hexagonScaling = 0
    }
}

