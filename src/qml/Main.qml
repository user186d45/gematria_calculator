import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    visible: true
    width: Screen.width
    height: Screen.height
    title: "Gematria Calculator"

    property bool lightMode: true
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    function navigateTo(pageName, properties = {}) {
        stackView.pop()
        stackView.push(pageName, properties)

    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MainPage.qml"

    }

}

