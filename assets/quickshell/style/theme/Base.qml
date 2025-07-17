import QtQuick

QtObject {
    readonly property string name: "Default"

    readonly property DarkBase dark: DarkBase {}
    readonly property LightBase light: LightBase {}

    readonly property color primary: ""
    readonly property color secondary: ""
    readonly property color accent: ""

    readonly property color red: "#FFADAD"
    readonly property color orange: "#FFD6A5"
    readonly property color yellow: "#FDFFB6"
    readonly property color green: "#CAFFBF"
    readonly property color blue: "#9BF6FF"

    component DarkBase: QtObject {
        readonly property color block: "#1D232A"
        readonly property color surface: "#191E24"
        readonly property color field: "#15191E"
        readonly property color content: "#ECF9FF"
    }

    component LightBase: QtObject {
        readonly property color surface: "#FFFFFF"
        readonly property color block: "#F8F8F8"
        readonly property color field: "#EEEEEE"
        readonly property color content: "#18181B"
    }
}
