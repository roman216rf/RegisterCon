import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import "../components" as RegComponents

Window{
    id: formSetting
    modality: Qt.WindowModal
    flags: Qt.Dialog
    color: "#97D176"
    width: 600
    height: 320

    TabBar{
        id: tabBarSetting
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        width: 100
        contentHeight: 40

        contentItem: ListView{
            model: tabBarSetting.contentModel
            currentIndex: tabBarSetting.currentIndex

            spacing: 0
            orientation: ListView.Vertical
            flickableDirection: Flickable.AutoFlickDirection
            snapMode: ListView.SnapToItem

            highlightMoveDuration: 0
            highlightRangeMode: ListView.ApplyRange
            preferredHighlightBegin: 40
            preferredHighlightEnd: height - 40
        }

        background:Rectangle{
            id: areaItems
            anchors.fill: parent
            color: "#97D176"
            border.color: "#1CA334"
            border.width: 1
            radius: 4

            smooth: true
            layer.enabled: true
            layer.effect:DropShadow{
                anchors.fill: areaItems
                horizontalOffset: 2
                verticalOffset: 2
                radius: 6.0
                samples: 10
                color: "#80000000"
                source: areaItems
            }
        }
        RegTabButtonSetting{
            text: "Подключение"
        }
        RegTabButtonSetting{
            text: "Шаблон"
        }
    }

    StackLayout{
        id: mainLayout
        anchors.top: parent.top
        anchors.left: tabBarSetting.right
        anchors.right: applyButton.left
        anchors.bottom: parent.bottom
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        currentIndex: tabBarSetting.currentIndex

        RegItemTabSetting{
            id: connect
        }
        RegItemTabSetting{
            id: template
        }
    }

    RegButtonPopup{
        id: applyButton
        text: "Принять"
        width: 80
        height: 30
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10
    }

    RegButtonPopup{
        id: cancelButton
        text: "Отменить"
        width: 80
        height: 30
        anchors.top: applyButton.bottom
        anchors.right: parent.right
        anchors.topMargin: 10
        anchors.rightMargin: 10
    }
}
