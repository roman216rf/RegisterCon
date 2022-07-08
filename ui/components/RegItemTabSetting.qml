import QtQuick 2.0
import QtGraphicalEffects 1.15

Item{
    Rectangle{
        id: areaSettings

        anchors.fill: parent

        color: "#97D176"
        border.color: "#1CA334"
        border.width: 1
        radius: 4

        smooth: true
        layer.enabled: true
        layer.effect:DropShadow{
            anchors.fill: areaSettings
            horizontalOffset: 2
            verticalOffset: 2
            radius: 6.0
            samples: 10
            color: "#80000000"
            source: areaSettings
        }
    }
}
