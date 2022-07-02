import QtQuick 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "../components" as RegComponents

Window{
    id: formCreateTabContracts
    modality: Qt.WindowModal
    flags: Qt.Dialog
    color: "transparent"
    width: 320
    height: 140
    Rectangle{
        anchors.fill: parent
        color: "#97D176"
        opacity: 0.9

        RegComponents.RegBlackText{
            id: label
            text: "Название услуги или товара"
            width: parent.width
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 10
            horizontalAlignment: Text.AlignHCenter
        }

        TextField{
            id: name
            placeholderText: "Введите название услуги или товара"
            color: "#000000"
            font.pixelSize: 14
            font.styleName: "Black"
            width: parent.width - 60
            anchors.top: label.bottom
            anchors.left: parent.left
            anchors.topMargin: 10
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            horizontalAlignment: Text.AlignHCenter
        }

        Button{
            id: acceptButton
            width: parent.width/2
            height: 40
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            background: Rectangle{
                color: acceptButton.hovered ? "#42D45C" : "#1CA334"
                anchors.fill: parent
            }
            onClicked:{
                contractsTabBar.addItem(addTabButton.createObject(contractsTabBar, {text: name.text}))
                formCreateTabContracts.close()
            }
            RegComponents.RegWhiteText{
                text: "Ок"
                anchors.centerIn: parent
            }
        }
        Button{
            id: cancelButton
            width: parent.width/2
            height: 40
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.left: acceptButton.right
            background: Rectangle{
                color: cancelButton.hovered ? "#42D45C" : "#1CA334"
                anchors.fill: parent
            }
            onClicked:{
                formCreateTabContracts.close()
            }
            RegComponents.RegWhiteText{
                text: "Отмена"
                anchors.centerIn: parent
            }
        }
    }
}
