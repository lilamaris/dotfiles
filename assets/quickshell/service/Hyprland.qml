pragma Singleton

import Quickshell
import Quickshell.Hyprland
import Quickshell

Singleton {
    id: root

    readonly property var workspaces: Hyprland.workspaces
    readonly property var monitors: Hyprland.monitors
}
