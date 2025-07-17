pragma Singleton

import Quickshell

import "../style"
import "../style/theme"

Singleton {
    id: theme

    property bool isLight: true
    property Base current: Base {}
}
