import QtQuick 2.0
import QtQuick.Controls 1.2;

Rectangle {
    signal pickBag();
    color: "Bisque";


    Text {
        id: txt;
        anchors.centerIn: parent;
        text: "Since I was 5, I have been always dreaming about visit " + world.getTripTo() + "!";
    }
    Image {
        anchors.top: txt.bottom; anchors.left: txt.left; anchors.topMargin: 10;
        source: "img/" + world.getTripTo() + "_painting.png";
        height: win.height /2.2;
    }

    MouseArea {
        anchors.fill: parent;
        onClicked:
        {
            doorKitchen.enabled = true;
            ld.source = "genericRoom.qml"
        }
    }
}

