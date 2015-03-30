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

        source: "img/"+gameItem.level+"/"+roomTitle+".png";
    }

    Image {
        id: firstThing2;
        property int imgNum: 6;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        visible: world.isVisible(imgNum);
        source: "img/" + world.getImageName(imgNum) + ".png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                if(world.isBagCatched()&& !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }

    Image {
        id: secondThing2;

        property int imgNum: 7;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        visible: world.isVisible(imgNum);
        source: "img/" + world.getImageName(imgNum) + ".png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                if(world.isBagCatched()&& !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: thirdThing2;

        property int imgNum: 8;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        visible: world.isVisible(imgNum);
        source: "img/" + world.getImageName(imgNum) + ".png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                if(world.isBagCatched()&& !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: fourthThing2;
        property int imgNum: 9;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        visible: world.isVisible(imgNum);
        source: "img/" + world.getImageName(imgNum) + ".png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                if(world.isBagCatched()&& !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: fifthThing2;
        property int imgNum: 10;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        visible: world.isVisible(imgNum);
        source: "img/" + world.getImageName(imgNum) + ".png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                if(world.isBagCatched()&& !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: sixthThing2;

        property int imgNum: 11;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        visible: world.isVisible(imgNum);
        source: "img/" + world.getImageName(imgNum) + ".png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                if(world.isBagCatched()&& !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }

    Image {
        id: doorRef;

        //x: 1419*consts.scale;
        //y: 13*consts.scale;
        x: world.getDoorX(gameItem.level,4)*consts.scale;
        y: world.getDoorY(gameItem.level,4)*consts.scale;

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

        x: world.getDoorX(gameItem.level,0)*consts.scale;
        y: world.getDoorY(gameItem.level,0)*consts.scale;

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

        x: world.getDoorX(gameItem.level,1)*consts.scale;
        y: world.getDoorY(gameItem.level,1)*consts.scale;

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

        x: world.getDoorX(gameItem.level,2)*consts.scale;
        y: world.getDoorY(gameItem.level,2)*consts.scale;

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

        x: world.getDoorX(gameItem.level,3)*consts.scale;
        y: world.getDoorY(gameItem.level,3)*consts.scale;

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
