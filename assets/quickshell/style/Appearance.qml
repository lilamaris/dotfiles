pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property Rounding rounding: Rounding {}
    readonly property Spacing spacing: Spacing {}
    readonly property Padding padding: Padding {}
    readonly property FontFamily fontFamily: FontFamily {}
    readonly property FontSize fontSize: FontSize {}
    readonly property Curve curve: Curve {}
    readonly property Duration duration: Duration {}

    component Rounding: QtObject {
        readonly property int sm: 12
        readonly property int md: 17
        readonly property int lg: 25
        readonly property int full: 1000
    }

    component Spacing: QtObject {
        readonly property int sm: 7
        readonly property int md: 10
        readonly property int lg: 25
    }

    component Padding: QtObject {
        readonly property int sm: 5
        readonly property int md: 10
        readonly property int lg: 15
    }

    component FontFamily: QtObject {
        readonly property string sans: "IBM Plex Sans"
        readonly property string mono: "JetBrains Mono NF"
        readonly property string material: "Material Symbols Rounded"
    }

    component FontSize: QtObject {
        readonly property int sm: 11
        readonly property int md: 13
        readonly property int lg: 18
    }

    component Curve: QtObject {
        readonly property list<real> standard: [0.2, 0, 0, 1, 1, 1]
        readonly property list<real> standardAccel: [0.3, 0, 1, 1, 1, 1]
        readonly property list<real> standardDecel: [0, 0, 0, 1, 1, 1]
    }

    component Duration: QtObject {
        readonly property int fast: 200
        readonly property int normal: 400
        readonly property int slow: 600
    }
}
