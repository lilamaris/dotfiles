import Quickshell
import QtQuick
import QtQuick.Controls

import "root:/component"
import "root:/style"
import "root:/service"

Variants {
    model: Quickshell.screens

    Scope {
        id: scope

        required property ShellScreen modelData

        StyledWindow {
            id: barPlace

            screen: scope.modelData

            name: "bar"
            anchors {
                left: true
                right: true
                top: true
            }
            implicitHeight: bar.implicitHeight + Appearance.padding.sm * 2

            StyledRect {
                id: bar
                anchors {
                    leftMargin: Appearance.padding.sm
                    rightMargin: Appearance.padding.sm
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 30
                radius: Appearance.rounding.sm
                color: Theme.block

                Button {
                    id: root
                    text: Theme.darkMode ? "Day" : "Night"
                    onPressed: Theme.toggleMode()
                }
            }
        }
    }
}
