import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Item{
    id: consts;
    signal pickBag();

property double scale: Screen.width/1920 > Screen.height/1080 ? Screen.height/1080 : Screen.width/1920;
    Image {
        id: bg;
        width: 1920*consts.scale;
        height: 1080*consts.scale;

        source: "img/0/kitchen-0.png";
    }

    Image {
        id: doorRef;

        x: 1419*consts.scale;
        y: 13*consts.scale;

        height: sourceSize.height*consts.scale;
        width: sourceSize.width*consts.scale;

        source: "img/0/door-refr.png"

        MouseArea{
            anchors.fill: parent;
            onClicked: openDoor(parent);
        }
    }

    Image {
        id: doorBot_0;

        x: 75*consts.scale;
        y: 493*consts.scale;

        height: sourceSize.height*consts.scale;
        width: sourceSize.width*consts.scale;

        source: "img/0/door-bot-0.png"
        MouseArea{
            anchors.fill: parent;
            onClicked: openDoor(parent);
        }
    }

    Image {
        id: doorBot_1;

        x: 412*consts.scale;
        y: 493*consts.scale;

        height: sourceSize.height*consts.scale;
        width: sourceSize.width*consts.scale;

        source: "img/0/door-bot-1.png"

        MouseArea{
            anchors.fill: parent;
            onClicked: openDoor(parent);
        }
    }
    Image {
        id: doorBot_2;

        x: 796*consts.scale;
        y: 493*consts.scale;

        height: sourceSize.height*consts.scale;
        width: sourceSize.width*consts.scale;

        source: "img/0/door-bot-2.png"

        MouseArea{
            anchors.fill: parent;
            onClicked: openDoor(parent);
        }
    }
    Image {
        id: doorBot_3;

        x: 1128*consts.scale;
        y: 493*consts.scale;

        height: sourceSize.height*consts.scale;
        width: sourceSize.width*consts.scale;

        source: "img/0/door-bot-3.png"

        MouseArea{
            anchors.fill: parent;
            onClicked: openDoor(parent);
        }
    }

    function openDoor(Parent){
        doorBot_0.visible = true;
        doorBot_1.visible = true;
        doorBot_2.visible = true;
        doorBot_3.visible = true;
        doorRef.visible = true;
        Parent.visible = false;
    }
}
