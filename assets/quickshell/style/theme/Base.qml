import QtQuick

QtObject {
    property string name: "Default"
    property bool isDefault: false

    property DarkBase dark: DarkBase {}
    property LightBase light: LightBase {}

    property color primary: "#000000"
    property color secondary: "#000000"
    property color accent: "#000000"

    property color red: "#FFADAD"
    property color orange: "#FFD6A5"
    property color yellow: "#FDFFB6"
    property color green: "#CAFFBF"
    property color blue: "#9BF6FF"

    component DarkBase: QtObject {
        property color block: "#1D232A"
        property color surface: "#191E24"
        property color field: "#15191E"
        property color content: "#ECF9FF"
    }

    component LightBase: QtObject {
        property color surface: "#FFFFFF"
        property color block: "#F8F8F8"
        property color field: "#EEEEEE"
        property color content: "#18181B"
    }
}
