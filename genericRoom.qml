import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Item {
    id: consts;
    signal pickBag();
    property double scale: Screen.width/1920 > Screen.height/1080 ? Screen.height/1080 : Screen.width/1920;

    Image {
        id: bg;
        width: 1920*win.scale;
        height: 1080*win.scale;

        source: "img/"+gameItem.level+"/"+roomTitle+".png";
    }

    Image{
        id: bagI;

        x: 560*consts.scale;
        y: 320*consts.scale;

        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;

        visible: !world.isBagCatched();
        source: "img/bag.png"
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                consts.pickBag();
                bagI.visible = false;
            }
        }
    }

    Image {
        id: firstThing;
        property int imgNum: 0;
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
                if(world.isBagCatched() && !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }

    Image {
        id: secondThing;
        property int imgNum: 1;
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
                if(world.isBagCatched() && !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: thirdThing;
        property int imgNum: 2;
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
                if(world.isBagCatched() && !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: fourthThing;
        property int imgNum: 3;
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
                if(world.isBagCatched() && !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: fifthThing;
        property int imgNum: 4;
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
                if(world.isBagCatched() && !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: sixthThing;
        property int imgNum: 5;
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
                if(world.isBagCatched() && !world.isBagFull()){
                    parent.visible = false;
                    pickThing(parent.imgNum);
                }
            }
        }
    }
    Image {
        id: books;
        x: world.getDoorX(gameItem.level,5)*consts.scale;
        y: world.getDoorY(gameItem.level,5)*consts.scale;

        height: sourceSize.height*consts.scale;
        width: sourceSize.width*consts.scale;
        source : "img/0/books-"+gameItem.level+".png"
    }
    Image {
        id: painting;
        property int imgNum: 6;
        x: world.getX(roomTitle,imgNum)*consts.scale;
        y: world.getY(roomTitle,imgNum)*consts.scale;
        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;
        source: "img/" + world.getTripTo() + "_painting.png";

        MouseArea{
            anchors.fill: parent;
            enabled: parent.visible;
            onClicked: {
                doorKitchen.enabled = false;
                ld.source = "about.qml";
                }
            }
        }
}
