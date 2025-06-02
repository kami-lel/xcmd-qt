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

    vertices: rectVertices
}
