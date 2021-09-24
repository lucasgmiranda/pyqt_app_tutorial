import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Button{
    id: btTopBar
    // CUSTOM PROPERTIES
    property url btIconSource: "../../images/svg/minimize_icon.svg"
    property color btColorDefault: "#1c1d20"
    property color btColorMouseOver: "#23272e"
    property color btColorClicked: "#00a1f1"

    QtObject{
        id: internal

        property var dynamicColor: if(btTopBar.down){
                                       btTopBar.down ? btColorClicked : btColorDefault
                                   } else {
                                       btTopBar.hovered ? btColorMouseOver : btColorDefault
                                   }

    }

    width: 35
    height: 35

    background: Rectangle{
        id: bgBt
        color: internal.dynamicColor
    }

    Image {
        id: iconBt
        source: btIconSource
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: 16
        width: 16
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    ColorOverlay{
        anchors.fill: iconBt
        source: iconBt
        color: "white"
        antialiasing: false
    }

}
