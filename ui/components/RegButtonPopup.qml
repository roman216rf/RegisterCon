import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.12
import "../components" as RegComponents

Button {
    id: button
    background: Rectangle{
        id: buttonbackground
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color: pressed ? "#ACD197" : "#97D176"
        border.color: "#1CA334"
        border.width: 2
        radius: 4
        smooth: true
        layer.enabled: true
        layer.effect:DropShadow{
            anchors.fill: buttonbackground
            horizontalOffset: 1
            verticalOffset: 1
            radius: 3.0
            samples: 4
            color: button.pressed ? "#00000000" : "#80000000"
            source: buttonbackground
        }
    }
    contentItem:
        RegBlackText{
        text: parent.text
        Layout.alignment: Qt.AlignCenter
    }
}
