import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: aboutPage
    width: Screen.width
    height: Screen.height
    color: "#f0f0f0"

    property bool lightMode: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "About"
            font.pixelSize: aboutPage.width / 20
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
        }

        Text {
            text: "Gematria Calculator\n\nVersion 0.1\n\nA Qt Quick application for calculating gematria values\nin Hebrew, Trigrammaton, and Greek systems."
            font.pixelSize: aboutPage.width / 30
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }

        Button {
            text: "Back to Main"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: aboutPage.width / 3
            Layout.preferredHeight: 50
            onClicked: root.navigateTo("MainForm.ui.qml")
        }
    }

    function navigateTo(pageName, properties = {}) {
        appWindow.navigateTo(pageName, properties)
    }
}