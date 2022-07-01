import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Layouts 1.12
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
        }
        Text{
            id: iconText
            anchors.top: iconImage.bottom
            Layout.alignment: Qt.AlignCenter
            text: tab.text
            color: "#ffffff"
            font.pixelSize: 14
            font.styleName: "Black"
        }
    }
}
