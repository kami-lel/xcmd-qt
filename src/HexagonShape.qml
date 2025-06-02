import QtQuick
import QtQuick.Shapes

Shape {
    id: hexagonShape

    property int maxRadius: -1
    property real scaling: 1.0
    readonly property int radius: maxRadius * scaling
    readonly property int xOffset: sqrt3 / 2 * radius
    readonly property int yOffset: radius / 2

    readonly property var hexagonVertices: [
        Qt.point( 0,        -radius  ),  // top
        Qt.point( xOffset,  -yOffset ),  // top-right
        Qt.point( xOffset,   yOffset ),  // bottom-right
        Qt.point( 0,         radius  ),  // bottom
        Qt.point(-xOffset,   yOffset ),  // bottom-left
        Qt.point(-xOffset,  -yOffset )   // top-left
    ]

    property var vertices: hexagonVertices

    width: maxRadius * 2;
    height: maxRadius * 2;
    anchors.centerIn: parent

    ShapePath {
        strokeColor: "black"
        strokeWidth: 4
        fillColor: "grey"
        capStyle: ShapePath.RoundCap

        startX: vertices[0].x;  startY: vertices[0].y

        PathLine { x: vertices[1].x; y: vertices[1].y }
        PathLine { x: vertices[2].x; y: vertices[2].y }
        PathLine { x: vertices[3].x; y: vertices[3].y }
        PathLine { x: vertices[4].x; y: vertices[4].y }
        PathLine { x: vertices[5].x; y: vertices[5].y }
        PathLine { x: vertices[0].x; y: vertices[0].y }
    }
}
