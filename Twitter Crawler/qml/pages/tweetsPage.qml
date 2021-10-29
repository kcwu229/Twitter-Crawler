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
            color: "#f7ac96"
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
                    id: textField2
                    color: "#000000"
                    colorOnFocus: "#aaacb0"
                    colorMouseOver: "#cfd7e7"
                    font.pointSize: 10
                    placeholderTextColor: "#000000"
                    colorDefault: "#ffffff"
                    placeholderText: "Type the screen name and pages here"
                    Layout.fillWidth: true
                    Keys.onEnterPressed: {
                        backend.replyText2(textField2.text)
                    }
                    Keys.onReturnPressed: {
                        backend.replyText2(textField2.text)
                    }
                }

                CustomButton{
                    id: btnSearchName2
                    text: "Search"
                    font.bold: true
                    font.pointSize: 11
                    colorPressed: "#543b08"
                    colorMouseOver: "#a16b0a"
                    colorDefault: "#f78229"
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 250
                    onClicked: {
                         backend.replyText2(textField2.text)
                    }
                }

                Switch {
                    id: switchHome
                    text: qsTr("Switch")
                    wheelEnabled: false
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
            color: "#fd8753"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 26
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 24

            Label {
                id: labelTextName2
                y: 8
                height: 25
                color: "#ffffff"
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
                    color: "#ffffff"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'PMingLiU'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2','Segoe UI','Segoe UI Black'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline; color:#ffffff;\">Introduction</span></p>\n<p align=\"center\" style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI','Segoe UI Black'; font-size:11pt; font-weight:600; font-style:italic; text-decoration: underline;\"><br /></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2','Segoe UI','Segoe UI Black'; font-size:8.25pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\">In here:</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\">    1) Enter the user name you want to search for, and number of pages that you want to collect </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\">           (one pages contains 20 tweets,   2 pages = 40 tweets ...)</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\">     </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\">    2) Example,   type joebiden, 1    if you want 20 tweets from joebiden</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'PMingLiU','Segoe UI','Segoe UI Black'; font-size:10pt; font-weight:600;\">    3) Press Search and wait for the result !</span></p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 12
                    font.family: "Tahoma"
                    anchors.leftMargin: 60
                    anchors.topMargin: 0
                    anchors.rightMargin: -168
                    anchors.bottomMargin: -106
                    textFormat: Text.RichText
                }
            }
        }
    }

    Connections{
        target: backend

        function onSetName2(name){
            labelTextName2.text = name
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
