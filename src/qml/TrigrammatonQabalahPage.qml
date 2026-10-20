import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: trigrammatonPage
    width: Screen.width
    height: Screen.height
    color: "#f0f0f0"

    property bool lightMode: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        Text {
            text: "Trigrammaton Qabalah"
            font.pixelSize: trigrammatonPage.width / 20
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
        }

        Text {
            text: "Trigrammaton (three-letter divine name) gematria calculator.\nImplementation coming soon."
            font.pixelSize: trigrammatonPage.width / 30
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }

        Button {
            text: "Back to Main"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: trigrammatonPage.width / 3
            Layout.preferredHeight: 50
            onClicked: root.navigateTo("MainForm.ui.qml")
        }
    }

    function navigateTo(pageName, properties = {}) {
        appWindow.navigateTo(pageName, properties)
    }
}