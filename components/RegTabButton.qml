import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15
import "../components" as RegComponents

TabButton{
    id: tab
    property bool onIcon
    onIcon: false
    width: onIcon ? parent.width : tab.width
    background: Rectangle{
        color: checked ? "#136E23": hovered ? "#42D45C" : "#1CA334"
        anchors.fill: parent
    }

    contentItem: ColumnLayout{
        id:layout
        anchors.fill: parent
        spacing: 2
        Image{
            id: iconImage
            source: tab.icon.source
            Layout.preferredHeight: onIcon ? 50 : tab.height / 4
            Layout.preferredWidth: onIcon ? 50 : 0
            Layout.alignment: Qt.AlignCenter
            smooth: true
            layer.enabled: true
            layer.effect:DropShadow{
                anchors.fill: iconImage
                horizontalOffset: 3
                verticalOffset: 3
                radius: 8.0
                samples: 17
                color: tab.hovered ? "#80000000" : "#00000000"
                source: iconImage
            }
        }
        RegComponents.RegWhiteText{
            id: iconText
            anchors.top: iconImage.bottom
            Layout.alignment: Qt.AlignCenter
            text: tab.text
        }
    }
}
