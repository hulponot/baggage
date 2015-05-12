import QtQuick 2.0

Image {
    anchors.fill: parent;
    source: "img/tutor.png";
    MouseArea{
        anchors.fill: parent;
        onClicked: {
            mainLd.source = "game.qml";
        }
    }
}

