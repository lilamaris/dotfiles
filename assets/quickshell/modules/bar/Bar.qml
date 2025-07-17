import QtQuick
import Quickshell

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: bar
            required property var modelData
            screen: modelData

            implicitHeight: 25

            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            Rectangle {
                color: "red"
                anchors {
                    left: parent.left
                    right: parent.right
                }
                implicitHeight: 25
            }
        }
        // Loader {
        //     id: loader
        //
        //     sourceComponent: PanelWindow {
        //         id: bar
        //         required property var modelData
        //         screen: modelData
        //
        //         implicitHeight: 25
        //         color: "transparent"
        //
        //         anchors {
        //             top: true
        //             left: true
        //             right: true
        //         }
        //
        //         Rectangle {
        //             color: "red"
        //
        //             anchors {
        //                 left: parent.left
        //                 right: parent.right
        //             }
        //
        //             implicitHeight: 15
        //         }
        //     }
        // }
    }
}
