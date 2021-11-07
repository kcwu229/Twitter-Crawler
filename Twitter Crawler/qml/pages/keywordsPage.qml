import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0

Item {
    property alias scrollView: scrollView
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangleTop
            height: 69
            color: "#495163"
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
                    placeholderText: "Type the keywords here"
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
            color: "#1d2128"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 10

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
                y: -273
                height: 265
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelDate.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: -177
                anchors.leftMargin: -43
                anchors.bottomMargin: 8
                anchors.topMargin: 10

                Text {
                    id: textHome
                    color: "#a6b5da"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'PMingLiU'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Segoe UI'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\">Introduction</span></p>\n<p align=\"center\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\"><br /></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI'; font-size:8.25pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">In here:</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI'; font-size:10pt;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">    1) Enter the user name you want to search for</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">        - If you are seraching for a single word, then type that word  e.g. apple</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">       </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">        - If you are searching for multiple words, please use a comma to separate them</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">           e.g. (search for apple and orange   , then type  apple,  orange)</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI'; font-size:10pt;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">    2) Enter the number of pages that you want to collect (each pages contains 20 tweets)</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI'; font-size:10pt;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI'; font-size:10pt;\">    3) Press Search and wait for the result !</span></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 12
                    font.family: "Segoe UI"
                    anchors.leftMargin: 57
                    anchors.topMargin: 13
                    anchors.rightMargin: -165
                    anchors.bottomMargin: -119
                    textFormat: Text.RichText
                }
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
