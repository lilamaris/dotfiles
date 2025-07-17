pragma Singleton
import QtQuick
import "root:/style/theme"

QtObject {
    id: themeService

    property Base current: Base {}
    property bool darkMode: false

    readonly property color primary: current.primary
    readonly property color secondary: current.secondary
    readonly property color accent: current.accent
    readonly property color block: darkMode ? current.dark.block : current.light.block
    readonly property color surface: darkMode ? current.dark.surface : current.light.surface
    readonly property color field: darkMode ? current.dark.field : current.light.surface
    readonly property color content: darkMode ? current.dark.content : current.light.content

    readonly property var themeFiles: ["Dracula", "Stella"]
    property list<Base> themes: []

    Component.onCompleted: init()

    function init() {
        for (var i = 0; i < themeFiles.length; ++i) {
            var comp = Qt.createComponent("root:/style/theme/" + themeFiles[i] + ".qml");
            if (comp.status === Component.Ready) {
                var instance = comp.createObject(this);
                themes.push(instance);
                if (instance.isDefault) current = instance
                console.info("[Service:Theme] Find Theme:", instance.name);
            } else {
                console.error("Failed to load", themeFiles[i], comp.errorString());
            }
        }
    }

    function setTheme(name) {
      var target = themes.find(theme => theme.name === name)
      if (!target) {
        console.error(`Failed to set theme ${name}: Not found`)
      }
      current = target
    }

    function toggleMode() {
      darkMode = !darkMode
    }

    function setMode(dark) {
      darkMode = dark
    }

}
