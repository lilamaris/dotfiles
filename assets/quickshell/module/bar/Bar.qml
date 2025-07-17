import Quickshell
import QtQuick

import "../../component"
import "../../style"

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
            color: "red"

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
                color: "blue"
            }
        }
    }
}
