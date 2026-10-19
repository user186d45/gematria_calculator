import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: mainPage
    width: Screen.width
    height: Screen.height
    color: "#f0f0f0"

    property bool lightMode: true
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    ColumnLayout {
        id: mainPageColumnLayout
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        Image {
            id: imageDailyQuote
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: mainPage.width / 2.5
            Layout.preferredHeight: mainPage.height / 3
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
            Layout.fill = parent
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
                    text: "Hebrew Kabbalah"
                    font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    onClicked: root.navigateTo("HebrewKabbalahPage.qml")

                }

                Button {
                    id: buttonTrigrammatonKabbalah
                    text: "Trigrammaton Kabbalah"
                    font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    onClicked: root.navigateTo("TrigrammatonKabbalahPage.qml")

                }

                Button {
                    id: buttonGreekKabbalah
                    text: "Greek Kabbalah"
                    font.pixelSize: rectangleMarqueeDailyQuoteArea.width / 22
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60
                    onClicked: root.navigateTo("GreekKabbalahPage.qml")

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

