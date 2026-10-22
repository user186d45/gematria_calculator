import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

Rectangle {
    id: pageHebrewKabbalah

    width: Screen.width
    height: Screen.height
    color: "#f0f0f0"

    property bool lightMode: true
    property color reallyDark: "#1f1f1f"
    property color dark: "#262626"
    property color reallyLight: "#e7e7e7"
    property color light: "#e0e0e0"

    property int tableFontSize: Math.round(pageHebrewKabbalah.width / 30)

    ColumnLayout {
        id: columnLayoutHebrewKabbalahPage

        anchors.fill: parent
        anchors.margins: 20

        spacing: 15

        ButtonGroup {
            buttons: flowCalculationTypeButtons.children

        }

        Flow {
            id: flowCalculationTypeButtons

            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            spacing: 5

            layoutDirection: Qt.RightToLeft

            RadioButton {
                checked: true
                text: "גמטריא"

            }

            RadioButton {
                text: "גדולה"

            }

            RadioButton {
                text: "משפר קטן"

            }

            RadioButton {
                text: "משפר סדורי"

            }

            RadioButton {
                text: "משפר מרובע"

            }

            RadioButton {
                text: "אתבש"

            }

            RadioButton {
                text: "אלבם"

            }

            RadioButton {
                text: "משפר קטן מספרי"

            }

        }

        TextField {
            id: textFieldInputHebrewKabbalah

            Layout.fillWidth: true
            Layout.preferredHeight: pageHebrewKabbalah.height / 20
            Layout.alignment: Qt.AlignHCenter

            placeholderText: "Enter Hebrew word"
            font.pixelSize: pageHebrewKabbalah.width / 25

            onTextChanged: {
                if (textFieldInputHebrewKabbalah.text.length === 0) {
                    textHebrewKabbalahNumericalValueOutput.text = "Valor numeralis hic apparebit"
                } else {
                    // TODO

                }

            }

        }

        Text {
            id: textHebrewKabbalahNumericalValueOutput

            Layout.fillWidth: true
            Layout.preferredHeight: pageHebrewKabbalah.height / 25
            Layout.alignment: Qt.AlignHCenter

            horizontalAlignment: Text.AlignHCenter

            font.pixelSize: pageHebrewKabbalah.width / 20
            font.bold: true

        }

        TableView {
            id: tableViewPageHebrewKabbalah

            Layout.fillWidth: true
            Layout.preferredHeight: pageHebrewKabbalah.height * 3/4
            Layout.alignment: Qt.AlignHCenter

            columnSpacing: 1
            rowSpacing: 1
            clip: true

            model: TableModel {
                TableModelColumn { display: "Word" }
                TableModelColumn { display: "Translation" }

                rows: [
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word1",
                        "Translation": "translation1"
                    },
                    {
                        "Word": "word2",
                        "Translation": "translation2"
                    }
                ]

            }

            delegate: Rectangle {
                implicitWidth: parent.width / 2
                implicitHeight: parent.height / 10

                required property string display

                Text {
                    text: parent.display
                    anchors.centerIn: parent

                }

            }

        }

    }

}
