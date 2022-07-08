import QtQuick 2.0
import QtQuick.Controls 2.15

TabButton{
    id: connect
    width: parent.width
    contentItem: RegBlackText{
        text: parent.text
    }
    background: Rectangle{
        anchors.fill: parent
        color: connect.checked ? "#1CA334" : "transparent"
    }
}
