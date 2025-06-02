import QtQuick 2.15
import QtQuick.Shapes

HexagonShape {
    id: searchboxContainer

    property real shapeShift: 0.0  // 0=hexagon, 1=rectangle

    // for when in rectangular mode
    property int rectWidth: 300
    property int rectHeight: 120

    readonly property int halfRectWidth: rectWidth / 2
    readonly property int halfRectHeight: rectHeight /2

    width: rectWidth
    height: rectHeight

    readonly property var rectVertices: [
        Qt.point(  0,               -halfRectHeight ),  // top
        Qt.point(  halfRectWidth,   -halfRectHeight ),  // top-right
        Qt.point(  halfRectWidth,    halfRectHeight ),  // bottom-right
        Qt.point(  0,                halfRectHeight ),  // bottom
        Qt.point( -halfRectWidth,    halfRectHeight ),  // bottom-left
        Qt.point( -halfRectWidth,   -halfRectHeight )   // top-left
    ]

    function interpolatePoint(p0, p1, t) {
        return Qt.point(
                p0.x + (p1.x - p0.x) * t,
                p0.y + (p1.y - p0.y) * t
        );
    }

    vertices: [
        interpolatePoint(hexagonVertices[0], rectVertices[0], shapeShift),
        interpolatePoint(hexagonVertices[1], rectVertices[1], shapeShift),
        interpolatePoint(hexagonVertices[2], rectVertices[2], shapeShift),
        interpolatePoint(hexagonVertices[3], rectVertices[3], shapeShift),
        interpolatePoint(hexagonVertices[4], rectVertices[4], shapeShift),
        interpolatePoint(hexagonVertices[5], rectVertices[5], shapeShift)
    ]

}
