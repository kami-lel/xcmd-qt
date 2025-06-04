HexagonShape {
    id: searchboxContainer

    // property to switch between shape types: 0 = hexagon, 1 = rectangle
    property real shapeShift: 0.0

    // rectangle mode properties
    property int rectWidth: 500
    property int rectHeight: 80
    readonly property int halfRectWidth: rectWidth / 2
    readonly property int halfRectHeight: rectHeight / 2

    // bug width & height is not dynamically changed
    width: rectWidth
    height: rectHeight

    // vertices for rectangle shape
    readonly property var rectVertices: [
        Qt.point(  0,               -halfRectHeight ),  // top
        Qt.point(  halfRectWidth,   -halfRectHeight ),  // top-right
        Qt.point(  halfRectWidth,    halfRectHeight ),  // bottom-right
        Qt.point(  0,                halfRectHeight ),  // bottom
        Qt.point( -halfRectWidth,    halfRectHeight ),  // bottom-left
        Qt.point( -halfRectWidth,   -halfRectHeight )   // top-left
    ]

    // linear interpolation between two points
    function interpolatePoint(start_point, end_point, progress) {
        return Qt.point(
                start_point.x + (end_point.x - start_point.x) * progress,
                start_point.y + (end_point.y - start_point.y) * progress
        );
    }

    // interpolated vertices for shape transition
    vertices: [
        interpolatePoint(hexagonVertices[0], rectVertices[0], shapeShift),
        interpolatePoint(hexagonVertices[1], rectVertices[1], shapeShift),
        interpolatePoint(hexagonVertices[2], rectVertices[2], shapeShift),
        interpolatePoint(hexagonVertices[3], rectVertices[3], shapeShift),
        interpolatePoint(hexagonVertices[4], rectVertices[4], shapeShift),
        interpolatePoint(hexagonVertices[5], rectVertices[5], shapeShift)
    ]
}
