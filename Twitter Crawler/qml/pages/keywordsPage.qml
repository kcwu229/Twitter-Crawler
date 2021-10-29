import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        Rectangle {
            id: rectangleTop
            height: 69
            color: "#f2abbc"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 40

            GridLayout {
                anchors.fill: parent
                anchors.rightMargin: 8
                anchors.leftMargin: 10
                rows: 1
                columns: 3

                CustomTextField{
                    id: textField3
                    color: "#000000"
                    placeholderText: "Type keywords"
                    font.pointSize: 10
                    colorOnFocus: "#aaacb0"
                    colorMouseOver: "#cfd7e7"
                    placeholderTextColor: "#000000"
                    colorDefault: "#ffffff"
                    Layout.fillWidth: true
                    Keys.onEnterPressed: {
                        backend.replyText3(textField2.text)
                    }
                    Keys.onReturnPressed: {
                        backend.replyText3(textField2.text)
                    }
                }

                CustomButton{
                    id: btnSearchName3
                    text: "Search"
                    font.pointSize: 11
                    colorDefault: "#f77e7e"
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 250
                    onClicked: {
                        backend.replyText3(textField3.text)
                    }
                }

                Switch {
                    id: switchHome
                    text: qsTr("Switch")
                    checked: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 68
                    // Change Show/Hide Frame
                    onToggled: {
                        backend.showHideRectangle(switchHome.checked)
                    }
                }
            }
        }

        Rectangle {
            id: rectangleVisible
            color: "#f385b2"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 16

            Label {
                id: labelTextName3
                y: 8
                height: 25
                color: "#5c667d"
                text: qsTr("")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Courier"
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                font.pointSize: 12
            }

            ScrollView {
                id: scrollView
                y: 8
                height: 345
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: 51
                anchors.leftMargin: 23
                anchors.bottomMargin: -18

                Text {
                    id: textHome
                    color: "#ffffff"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'PMingLiU'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\">Introduction</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\"><br /></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">In here:</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">    1) Enter user name</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:1; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">  For a single word, type the word  e.g. apple</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">       </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">          Multiple words, please use a comma to separate them</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">           e.g. (search apple and orange, type  apple,  orange)</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Arial Black'; font-size:12pt; font-weight:600;\">    2) Press Search and wait for the result !</span></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 12
                    font.family: "Segoe UI"
                    anchors.leftMargin: 8
                    anchors.topMargin: 16
                    anchors.rightMargin: -68
                    anchors.bottomMargin: -94
                    textFormat: Text.RichText
                }
            }

            BorderImage {
                id: borderImage
                x: 437
                y: 106
                width: 207
                height: 184
                source: "../../../wp1973532-twitter-logo-wallpapers.png"
            }
        }
    }

    Connections{
        target: backend

        function onSetName3(name){
            labelTextName3.text = name
        }

        function onIsVisible(isVisible){
            rectangleVisible.visible = isVisible
        }

    }





}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
