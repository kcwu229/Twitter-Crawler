import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../components"
import QtQuick.Controls.Material 2.15

Item {
    Rectangle {
        id: bg
        color: "#151515"
        radius: 10
        anchors.fill: parent
        z: 1

        Image {
            id: background
            anchors.fill: parent
            source: "../../images/bg.png"
            anchors.topMargin: 0
            fillMode: Image.PreserveAspectFit

            CustomTextField {
                id: consumer_secret
                y: 222
                width: 266
                height: 40
                opacity: 1
                color: "#000000"
                text: "CmGwDXv6WvM79dkKIx1UZwE15YJI532ktCBXq3zMX1Azfe7JFj"
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 297
                anchors.rightMargin: 96
                font.bold: true
                font.italic: true
                font.family: "Tahoma"
                font.pointSize: 10
                placeholderTextColor: "#2b2a29"
                colorDefault: "#60adbbd7"
                placeholderText: "Customer Secret"
                colorOnFocus: "#9c242831"
                colorMouseOver: "#a72b2f38"
            }

            CustomTextField {
                id: access_token
                y: 270
                width: 266
                height: 33
                opacity: 1
                color: "#000000"
                text: "3039143238-K3GIEUOMM13dC1vjdvXJMSgz9289ncF3mgDapZb"
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 297
                anchors.rightMargin: 96
                font.bold: true
                font.italic: true
                font.family: "Tahoma"
                font.pointSize: 10
                placeholderTextColor: "#2b2a29"
                colorDefault: "#60adbbd7"
                placeholderText: "Access Token"
                colorOnFocus: "#9c242831"
                colorMouseOver: "#a72b2f38"
            }

            CustomTextField {
                id: access_token_secret
                y: 317
                height: 33
                opacity: 1
                color: "#000000"
                text: "mwXNcK8OUX4Uxx5aNRqGEk28A1P5OjExvHOuoxApGohsF"
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                anchors.leftMargin: 297
                anchors.rightMargin: 96
                font.bold: true
                font.italic: true
                font.family: "Tahoma"
                font.pointSize: 10
                placeholderTextColor: "#2b2a29"
                colorDefault: "#60adbbd7"
                placeholderText: "Access Token Acess"
                colorOnFocus: "#9c242831"
                colorMouseOver: "#a72b2f38"
            }

            CustomTextField {
                id: consumer_key
                y: 171
                height: 40
                opacity: 1
                visible: true
                color: "#0b0b0b"
                text: "M7NS5nExt5tyfFA0dGL65KHyU"
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 96
                anchors.leftMargin: 297
                clip: false
                scale: 1
                font.bold: true
                font.italic: true
                font.family: "Tahoma"
                font.pointSize: 10
                placeholderTextColor: "#2b2a29"
                colorOnFocus: "#9c242831"
                colorMouseOver: "#a72b2f38"
                colorDefault: "#60adbbd7"
                placeholderText: "Customer Key"
            }

            CustomButton{
                id: btnLogin
                x: 370
                y: 374
                height: 26
                text: "Login"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 160
                anchors.leftMargin: 408
                colorDefault: "#0e96d9"
                colorPressed: "#499df4"
                font.pointSize: 10
                font.family: "Segoe UI"
                colorMouseOver: "#439bd8"
                onClicked: {
                    (backend.checkLogin(consumer_key.text, consumer_secret.text, access_token.text, access_token_secret.text))
                }
            }
        }
    }

    DropShadow{
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#40000000"
        z: 0
    }

    Connections{
        target: backend

        function onReadText(text){
            actualPage.setText = text
        }

        function onSignalLogin(boolValue) {
            if(boolValue){
            }
            else {
                consumer_key.color = "#ff0000"
                consumer_secret.color = "#ff0000"
                access_token.color = "#ff0000"
                access_token_secret.color = "#ff0000"
            }
        }
    }

}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/