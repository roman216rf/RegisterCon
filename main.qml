import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3
import QtGraphicalEffects 1.15
import QtQml.Models 2.15
import "components" as RegComponents

ApplicationWindow {
    id: application
    width: 740
    height: 580
    visible: true
    title: "RegisterCon"

    menuBar: MenuBar{
        id: menuBar
        background: Rectangle{
            width: parent.width
            color: "#1CA334"
        }

        Menu{
            padding: 1

            Action{
                text: "Опции"
                onTriggered: popupSetting.show()
            }
            MenuSeparator{
                background: Rectangle{
                    width: 200
                    height: 100
                    color: "#1CA334"
                }
                contentItem: Rectangle{
                    implicitWidth: 200
                    implicitHeight: 1
                    color: "#0D4A18"
                }
                bottomPadding: 5
                topPadding: 5
            }
            Action{
                text: "Выход"
                onTriggered: application.close()
            }

            delegate: MenuItem{
                id: menuItem
                background: Rectangle{
                    width: parent.width
                    height: parent.height
                    color: hovered ? "#42D45C" : "#1CA334"
                }

                contentItem: RegComponents.RegWhiteText{
                    text: menuItem.text
                }
            }
        }

        delegate: MenuBarItem{
            id: menuBarItem

            contentItem:ColumnLayout{
                anchors.fill: parent
                Image{
                    id: iconImageMenu
                    source: "qrc:/icons/menu.ico"
                    Layout.preferredHeight: 20
                    Layout.preferredWidth: 20
                    Layout.alignment: Qt.AlignCenter
                    smooth: true
                    layer.enabled: true
                    layer.effect:DropShadow{
                        anchors.fill: iconImageMenu
                        horizontalOffset: 3
                        verticalOffset: 3
                        radius: 8.0
                        samples: 17
                        color: "#80000000"
                        source: iconImageMenu
                    }
                }
            }

            background: Rectangle{
                width: parent.width
                height: parent.height
                color: hovered ? "#42D45C" : "#1CA334"
            }
        }
    }

    RegComponents.RegPopupCreateTabContracts{
        id: popupCreateTabContracts
    }
    RegComponents.RegSettingWindow{
        id: popupSetting
    }

    TabBar{
        id: mainTabBar

        anchors.left: parent.left
        anchors.top: menuBar.bottom
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

                Repeater {
                    model: ObjectModel{
                        id: modelObj
                    }
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
                RegComponents.RegItemTab{

                }
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
