import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt.labs.qmlmodels

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

    ColumnLayout {
        id: hebrewKabbalahPageColumnLayout
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        TextField {
            id: inputHebrewKabbalah
            Layout.fillWidth: true
            Layout.preferredHeight: hebrewKabbalahPage.height / 30
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Search"

            Connections {
                target: inputHebrewKabbalah

                function onTextChanged() {
                    if (inputHebrewKabbalah.text.length === 0) {
                        hebrewKabbalahNumericalValueOutput.text = "Valor numeralis hic apparebit"

                    } else {
                        // TODO: hebrewKabbalahNumericalValueOutput.text = 

                    }

                }

            }

        }

        Text {
            id: readOnlyTextHebrewKabbalahWordNumericalValue
            Layout.fillWidth: true
            Layout.preferredHeight: hebrewKabbalahPage.height / 30
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: hebrewKabbalahPage.width / 18
            font.bold: true

        }

        TableView {
            id: tableViewHebrewKabbalah

            model: TableModel {
                TableModelColumn { display: "Word" }
                TableModelColumn { display: "English translation" }
                TableModelColumn { display: "Numerical value" }
            }

            delegate: Rectangle {


            }
        }

    }

}

