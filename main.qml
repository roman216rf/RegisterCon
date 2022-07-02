import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import "components" as RegComponents

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("RegisterCon")

    RegComponents.RegPopupCreateTabContracts{
        id: popupCreateTabContracts
    }

    TabBar{
        id: mainTabBar

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 100
        contentHeight: height / count

        contentItem: ListView{
            model: mainTabBar.contentModel
            currentIndex: mainTabBar.currentIndex

            spacing: 0
            orientation: ListView.Vertical
            flickableDirection: Flickable.AutoFlickDirection
            snapMode: ListView.SnapToItem

            highlightMoveDuration: 0
            highlightRangeMode: ListView.ApplyRange
            preferredHighlightBegin: 40
            preferredHighlightEnd: height - 40
        }
        RegComponents.RegTabButton{
            text: "Договоры"
            icon.source: "qrc:/icons/contracts.ico"
            onIcon: true
        }
        RegComponents.RegTabButton{
            text: "Клиенты"
            icon.source: "qrc:/icons/clients.ico"
            onIcon: true
        }
        RegComponents.RegTabButton{
            text: "Исполнители"
            icon.source: "qrc:/icons/performer.ico"
            onIcon: true
        }
    }

    StackLayout{
        id: mainLayout
        anchors.left: mainTabBar.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        currentIndex: mainTabBar.currentIndex

        RegComponents.RegItemTab{
            id: contracts

            StackLayout{
                id: contractsLayout
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: contractsTabBar.top
                currentIndex: contractsTabBar.currentIndex
                RegComponents.RegItemTab{
                    id: test
                }
            }

            Component{
                id: addTabButton
                RegComponents.RegTabButton{
                    width: contracts.width / contractsTabBar.count
                    Connections{
                        target: contractsTabBar
                    }
                }
            }

            Component{
                id: addTabLayout
                RegComponents.RegItemTab{}
            }

            TabBar{
                id: contractsTabBar
                width: parent.width
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: addButton.top
                contentHeight: 40
                spacing: 0
                background: Rectangle{
                    color: "#97D176"
                    anchors.fill: parent
                }
            }

            Button{
                id: addButton
                width: contracts.width
                height: 40
                anchors.bottom: parent.bottom
                background: Rectangle{
                    color: addButton.hovered ? "#42D45C" : "#1CA334"
                    anchors.fill: parent
                }
                onClicked:{
                    popupCreateTabContracts.show()
                }
                RegComponents.RegWhiteText{
                    text: "Добавить"
                    anchors.centerIn: parent
                }
            }
        }
        RegComponents.RegItemTab{
            id: clients
        }
        RegComponents.RegItemTab{
            id: performer
        }
    }
}
