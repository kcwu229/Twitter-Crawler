import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: rectangleTop
            height: 69
            color: "#5181eb"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 40

            GridLayout {
                anchors.fill: parent
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                rows: 1
                columns: 3

                CustomTextField{
                    id: textField
                    font.pointSize: 10
                    color: "#000000"
                    placeholderText: "Type your screen name"
                    colorOnFocus: "#aaacb0"
                    colorMouseOver: "#cfd7e7"
                    placeholderTextColor: "#000000"
                    colorDefault: "#ffffff"
                    Layout.fillWidth: true
                    Keys.onEnterPressed: {
                        backend.replyText(textField.text)
                    }
                    Keys.onReturnPressed: {
                        backend.replyText(textField.text)
                    }
                }

                CustomButton{
                    id: btnSearchName
                    text: "Search"
                    font.pointSize: 11
                    colorDefault: "#274cb0"
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 250
                    onClicked: {
                        backend.replyText(textField.text)
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
            color: "#3c78e1"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 28
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 22

            Label {
                id: labelTextName
                y: 8
                height: 25
                color: "#ffffff"
                text: qsTr("The username you search:")
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Tahoma"
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                font.pointSize: 12
            }

            ScrollView {
                id: scrollView
                y: 39
                height: 297
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pointSize: 9
                clip: true
                anchors.rightMargin: 0
                anchors.leftMargin: 8
                anchors.bottomMargin: -15
                anchors.topMargin: 10

                Text {
                    id: textHome
                    x: -84
                    y: -215
                    color: "#ffffff"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'PMingLiU'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\">Introduction</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\"><br /></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI'; font-size:8.25pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600;\">1)  Enter the user name  e.g. @joebiden</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:12pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600;\">2) Press Search to get the result</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:12pt; font-weight:600;\"><br /></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 12
                    font.family: "Courier"
                    anchors.leftMargin: 6
                    anchors.topMargin: 11
                    anchors.rightMargin: -44
                    anchors.bottomMargin: -102
                    textFormat: Text.RichText

                    BorderImage {
                        id: borderImage
                        x: 470
                        y: 102
                        width: 137
                        height: 139
                        source: "../../../1111.PNG.png"
                    }
                }
            }
        }
    }

    Connections{
        target: backend

        function onSetName(name){
            labelTextName.text = name
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
