import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Button{
    id: btToggle
    // CUSTOM PROPERTIES
    property url btIconSource: "../../images/svg/menu_icon.svg"
    property color btColorDefault: "#1c1d20"
    property color btColorMouseOver: "#23272e"
    property color btColorClicked: "#00a1f1"

    QtObject{
        id: internal

        property var dynamicColor: if(btToggle.down){
                                       btToggle.down ? btColorClicked : btColorDefault
                                   } else {
                                       btToggle.hovered ? btColorMouseOver : btColorDefault
                                   }

    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle{
        id: bgBt
        color: internal.dynamicColor
    }

    Image {
        id: iconBt
        source: btIconSource
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        height: 25
        width: 25
        fillMode: Image.PreserveAspectFit
    }

    ColorOverlay{
        anchors.fill: iconBt
        source: iconBt
        color: "white"
        antialiasing: false
    }

}
