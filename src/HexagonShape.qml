import QtQuick
import QtQuick.Shapes

Shape {
    id: hexagonShape

    property int maxRadius: -1
    property real scaling: 1.0
    readonly property int radius: maxRadius * scaling
    readonly property int xOffset: sqrt3 / 2 * radius
    readonly property int yOffset: radius / 2

    // HACK fix
    width: maxRadius - 200
    height: maxRadius - 250
    // width: maxRadius * 2;
    // height: maxRadius * 2;
    anchors.centerIn: parent

    ShapePath {

        strokeColor: "black"
        strokeWidth: 4
        fillColor: "grey"
        capStyle: ShapePath.RoundCap

        // top point
        startX: 0
        startY: hexagonShape.radius

        PathLine {
        // top right point
            x: hexagonShape.xOffset
            y: hexagonShape.yOffset
        }
        PathLine {
        // bottom right point
            x: hexagonShape.xOffset
            y: -hexagonShape.yOffset
        }
        PathLine {
        // bottom point
            x: 0
            y: -hexagonShape.radius
        }
        PathLine {
        // bottom left point
            x: -hexagonShape.xOffset
            y: -hexagonShape.yOffset
        }
        PathLine {
        // bottom top point
            x: -hexagonShape.xOffset
            y: hexagonShape.yOffset
        }
        PathLine {
        // back to top point
            x: 0
            y: hexagonShape.radius
        }
    }
}
