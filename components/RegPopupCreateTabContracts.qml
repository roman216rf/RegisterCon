import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../components" as RegComponents

Window{
    id: formCreateTabContracts
    modality: Qt.WindowModal
    flags: Qt.Dialog
    color: "transparent"
    width: 320
    height: 240
    Rectangle{
        anchors.fill: parent
        color: "#97D176"
        opacity: 0.9

        RegComponents.RegBlackText{
            id: labelId
            text: "Идентификатор"
            width: parent.width
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 10
            horizontalAlignment: Text.AlignHCenter
        }

        TextField{
            id: idKod
            placeholderText: "Введите идентификатор услуги или товара"
            color: "#000000"
            font.pixelSize: 14
            font.styleName: "Black"
            width: parent.width - 60
            anchors.top: labelId.bottom
            anchors.left: parent.left
            anchors.topMargin: 10
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            horizontalAlignment: Text.AlignHCenter
            validator: RegularExpressionValidator{regularExpression: /^[a-z][A-z\d]*$/}
            onPressed: {
                idKod.color = "#000000"
                idKod.font.bold = false
            }
        }

        RegComponents.RegBlackText{
            id: labelName
            text: "Название услуги или товара"
            width: parent.width
            anchors.top: idKod.bottom
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
            anchors.top: labelName.bottom
            anchors.left: parent.left
            anchors.topMargin: 10
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            horizontalAlignment: Text.AlignHCenter
            validator: RegularExpressionValidator{regularExpression: /^[\d+\w+А-я+]([А-я\d\w]+\s?\(?\.?[А-я\d\w]*\)?)+$/}
            onPressed: {
                name.color = "#000000"
                name.font.bold = false
            }
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
                if (name.text == ""){
                    name.color = "Red"
                    name.font.bold = true
                }
                if (idKod.text == ""){
                    idKod.color = "Red"
                    idKod.font.bold = true
                }
                if (name.text != "" && idKod.text != ""){
                    contractsTabBar.addItem(addTabButton.createObject(contractsTabBar, {text: name.text}))
                    modelObj.append(addTabLayout.createObject(modelObj, {id: idKod.text}))
                    name.text = ""
                    idKod.text = ""
                    formCreateTabContracts.close()
                }
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
                name.text = ""
                formCreateTabContracts.close()
            }
            RegComponents.RegWhiteText{
                text: "Отмена"
                anchors.centerIn: parent
            }
        }
    }
}
