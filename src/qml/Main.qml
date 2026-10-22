import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: appWindow
    title: "Gematria Calculator"

    visible: true

    width: Screen.width
    height: Screen.height

    property bool lightMode: true
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    StackView {
        id: stackView

        anchors.fill: parent

        initialItem: componentMainPage

    }

    function navigateTo(pageName, properties = {}) {
        stackView.push(Qt.resolvedUrl(pageName), properties)

    }

    Component {
        id: componentMainPage
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
                            id: buttonHebrewKabbalah

                            Layout.fillWidth: true
                            Layout.preferredHeight: 60

                            text: "Hebrew Kabbalah"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22

                            onClicked: root.navigateTo("HebrewKabbalahPage.qml")

                        }

                        Button {
                            id: buttonTrigrammatonKabbalah

                            Layout.fillWidth: true
                            Layout.preferredHeight: 60

                            text: "Trigrammaton Kabbalah"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22

                            onClicked: root.navigateTo("TrigrammatonKabbalahPage.qml")

                        }

                        Button {
                            id: buttonGreekKabbalah

                            Layout.fillWidth: true
                            Layout.preferredHeight: 60

                            text: "Greek Kabbalah"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22

                            onClicked: root.navigateTo("GreekKabbalahPage.qml")

                        }

                        Button {
                            id: buttonAbout

                            Layout.fillWidth: true
                            Layout.preferredHeight: 60

                            text: "About"
                            font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22

                            onClicked: root.navigateTo("AboutPage.qml")

                        }

                    }

                }

            }

        }

    }

}

