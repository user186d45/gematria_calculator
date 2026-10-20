import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQml.Models 2.1

Rectangle {
    id: hebrewKabbalahPage
    width: Screen.width
    height: Screen.height
    color: "#f0f0f0"

    property bool lightMode: true
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    // Sample Hebrew words data - user can extend this
    ListModel {
        id: hebrewWordsModel
        ListElement { word: "אהבה"; translation: "Love"; value: 13 }
        ListElement { word: "שלום"; translation: "Peace"; value: 376 }
        ListElement { word: "אמת"; translation: "Truth"; value: 441 }
        ListElement { word: "חיים"; translation: "Life"; value: 68 }
        ListElement { word: "אור"; translation: "Light"; value: 207 }
        ListElement { word: "ברכה"; translation: "Blessing"; value: 227 }
        ListElement { word: "חכמה"; translation: "Wisdom"; value: 73 }
        ListElement { word: "אמונה"; translation: "Faith"; value: 102 }
        ListElement { word: "תפילה"; translation: "Prayer"; value: 515 }
        ListElement { word: "שמחה"; translation: "Joy"; value: 353 }
        ListElement { word: "תקוה"; translation: "Hope"; value: 43 }
        ListElement { word: "רחמים"; translation: "Mercy"; value: 308 }
    }

    // Hebrew letter values for calculation
    property var hebrewLetterValues: {
        "א": 1, "ב": 2, "ג": 3, "ד": 4, "ה": 5, "ו": 6, "ז": 7, "ח": 8, "ט": 9,
        "י": 10, "כ": 20, "ל": 30, "מ": 40, "נ": 50, "ס": 60, "ע": 70, "פ": 80,
        "צ": 90, "ק": 100, "ר": 200, "ש": 300, "ת": 400,
        "ך": 20, "ם": 40, "ן": 50, "ף": 80, "ץ": 90
    }

    function calculateGematria(text) {
        var total = 0
        for (var i = 0; i < text.length; i++) {
            var ch = text[i]
            if (hebrewLetterValues[ch] !== undefined) {
                total += hebrewLetterValues[ch]
            }
        }
        return total
    }

    // Font size for table
    property int tableFontSize: Math.round(hebrewKabbalahPage.width / 30)

    ColumnLayout {
        id: hebrewKabbalahPageColumnLayout
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        TextField {
            id: inputHebrewKabbalah
            Layout.fillWidth: true
            Layout.preferredHeight: hebrewKabbalahPage.height / 20
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Enter Hebrew word"
            font.pixelSize: hebrewKabbalahPage.width / 25
            onTextChanged: {
                if (inputHebrewKabbalah.text.length === 0) {
                    hebrewKabbalahNumericalValueOutput.text = "Valor numeralis hic apparebit"
                } else {
                    var value = calculateGematria(inputHebrewKabbalah.text)
                    hebrewKabbalahNumericalValueOutput.text = "Numerical value: " + value
                }
            }
        }

        // Centered result text
        Text {
            id: hebrewKabbalahNumericalValueOutput
            Layout.fillWidth: true
            Layout.preferredHeight: hebrewKabbalahPage.height / 25
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font.pixelSize: hebrewKabbalahPage.width / 20
            font.bold: true
            text: "Valor numeralis hic apparebit"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        // Table header
        Rectangle {
            Layout.fillWidth: true
            height: 45
            color: "#e0e0e0"

            Row {
                anchors.fill: parent
                spacing: 0

                Text {
                    width: parent.width / 3
                    text: "Word"
                    font.bold: true
                    font.pixelSize: tableFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: 10
                }

                Text {
                    width: parent.width / 3
                    text: "English Translation"
                    font.bold: true
                    font.pixelSize: tableFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                Text {
                    width: parent.width / 3
                    text: "Numerical Value"
                    font.bold: true
                    font.pixelSize: tableFontSize
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    rightPadding: 10

                }

            }

        }

        // Scrollable table
        Flickable {
            id: tableFlickable
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            contentHeight: tableColumn.height

            Column {
                id: tableColumn
                width: parent.width
                spacing: 0

                Repeater {
                    model: hebrewWordsModel
                    delegate: Rectangle {
                        width: parent.width
                        height: 50
                        color: index % 2 === 0 ? "#fafafa" : "#f0f0f0"
                        border.color: "#e0e0e0"
                        border.width: 1

                        Row {
                            anchors.fill: parent
                            spacing: 0

                            Text {
                                width: parent.width / 3
                                text: word
                                font.pixelSize: tableFontSize
                                font.bold: true
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                leftPadding: 10
                            }

                            Text {
                                width: parent.width / 3
                                text: translation
                                font.pixelSize: tableFontSize
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                            }

                            Text {
                                width: parent.width / 3
                                text: value
                                font.pixelSize: tableFontSize
                                font.bold: true
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                                rightPadding: 10
                            }
                        }
                    }
                }
            }
        }
    }

    function navigateTo(pageName, properties = {}) {
        appWindow.navigateTo(pageName, properties)
    }
}
