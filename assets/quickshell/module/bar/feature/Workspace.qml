import Quickshell.Hyprland
import QtQuick

ListView {
    id: wsList

    model: Quickshell.Hyprland.workspace

    Rectangle {
        width: 32
        height: 32
    }
}
