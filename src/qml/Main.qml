import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: appWindow
    visible: true
    width: Screen.width
    height: Screen.height
    title: "Gematria Calculator"

    property bool lightMode: true
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: mainPageComponent
    }

    function navigateTo(pageName, properties = {}) {
        stackView.push(Qt.resolvedUrl(pageName), properties)
    }

    // Main page UI (formerly MainForm.ui.qml)
    Component {
        id: mainPageComponent
        Rectangle {
            id: root
            width: Screen.width
            height: Screen.height
            color: "#f0f0f0"

            property bool lightMode: true
            property color reallyDark: "#1f1f1f"
            property color dark: "#262626"
            property color reallyLight: "#e7e7e7"
            property color light: "#e0e0e0"

            // Navigation delegated to ApplicationWindow
            function navigateTo(pageName, properties = {}) {
                appWindow.navigateTo(pageName, properties)
            }

            ColumnLayout {
                id: columnLayout
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Image {
                    id: imageDailyQuote
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: root.width / 2.5
                    Layout.preferredHeight: root.height / 3
                    source: "qrc:/images/triangle_tire.jpg"
                    fillMode: Image.PreserveAspectFit
                }

                Rectangle {
                    id: rectangleMarqueeDailyQuoteArea
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    color: "transparent"
                    clip: true

                    Text {
                        id: textMarqueeDailyQuote
                        text: qsTr("example text")
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 18
                        font.bold: true

                        SequentialAnimation on x {
                            running: true
                            loops: Animation.Infinite

                            PauseAnimation {
                                duration: 2000
                            }

                            PropertyAnimation {
                                from: rectangleMarqueeDailyQuoteArea.width
                                to: -textMarqueeDailyQuote.width
                                duration: 8000
                            }
                        }
                    }
                }

                Rectangle {
                    id: rectangleMainMenuButtons
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"
                    clip: true

                    ColumnLayout {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.margins: 10
                        spacing: 6

                        Button {
                            id: buttonHebrewQabalah
                            text: "Hebrew Qabalah"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                            Layout.fillWidth: true
                            Layout.preferredHeight: 60
                            onClicked: root.navigateTo("HebrewQabalahPage.qml")
                        }

                        Button {
                            id: buttonTrigrammatonQabalah
                            text: "Trigrammaton Qabalah"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                            Layout.fillWidth: true
                            Layout.preferredHeight: 60
                            onClicked: root.navigateTo("TrigrammatonQabalahPage.qml")
                        }

                        Button {
                            id: buttonGreekQabalah
                            text: "Greek Qabalah"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                            Layout.fillWidth: true
                            Layout.preferredHeight: 60
                            onClicked: root.navigateTo("GreekQabalahPage.qml")
                        }

                        Button {
                            id: buttonAbout
                            text: "About"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                            Layout.fillWidth: true
                            Layout.preferredHeight: 60
                            onClicked: root.navigateTo("AboutPage.qml")
                        }
                    }
                }
            }
        }
    }
}