import QtQuick

import "../style"

Rectangle {
    id: root

    color: "transparent"

    Behavior on color {
        ColorAnimation {
            duration: Appearance.duration.normal
            easing.type: Easing.BezierSpline
            easing.bezierCurve: Appearance.curve.standard
        }
    }
}
