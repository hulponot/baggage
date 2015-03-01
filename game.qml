import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import MyLib 1.0

Item {
    id: gameItem;
    property int timeLeft: 20;
    Loader {
        property int whatIsLoaded: 0;
        id: ld;
        source: "room-0.qml"
    }
    Connections {
        target: ld.item
        onPickBag: pickBag();
    }
    World{
        id: world;
    }

   MouseArea{
        width: 100;
        height: 100;

        onClicked: myTimer.start();//world.recreate();
    }

    MouseArea{
        id: doorKitchen;

        x: 1180*win.scale;
        y: (100)*win.scale;
        width: 315*win.scale;
        height: 450*win.scale;

        onClicked: {
            if (ld.whatIsLoaded == 0){
                ld.source = "kitchen-0.qml";
                ld.whatIsLoaded = 1;
                doorKitchen.enabled = false;
                doorRoom.enabled = true;
            }
        }
    }

    MouseArea{
        id: doorRoom;

        x: 20*win.scale;
        y: (1080-250)*win.scale;
        width: 300*win.scale;
        height: 200*win.scale;
        enabled: false;

        onClicked: {
            if (ld.whatIsLoaded == 1){
                ld.source = "room-0.qml";
                ld.whatIsLoaded = 0;
                doorKitchen.enabled = true;
                doorRoom.enabled = false;
            }
        }
    }
    Image {
        id: bagLine;
        visible: false;
        height: sourceSize.height*win.scale;
        width: sourceSize.width*win.scale;

        source: "img/bagLine.png"

        Image{
            id: zero;
            y: 779*win.scale;
            anchors.left: parent.left;
            anchors.leftMargin: 3*win.scale;
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            source: "img/" + world.whatIsInBag(0) + ".png"
            MouseArea {
                anchors.fill: parent;
                onClicked: removeFromBag(0);
            }
        }
        Image{
            id: one;
            y: 655*win.scale;
            anchors.left: parent.left;
            anchors.leftMargin: 3*win.scale;
            source: "img/" + world.whatIsInBag(1) + ".png"
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            MouseArea {
                anchors.fill: parent;
                onClicked:removeFromBag(1);
            }
        }
        Image{
            id: two;
            y: 534*win.scale;
            anchors.left: parent.left;
            anchors.leftMargin: 4*win.scale;
            source: "img/" + world.whatIsInBag(2) + ".png"
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            MouseArea {
                anchors.fill: parent;
                onClicked:removeFromBag(2);
            }
        }
        Image{
            id: three;
            y: 416*win.scale;
            anchors.left: parent.left;
            anchors.leftMargin: 3*win.scale;
            source: "img/" + world.whatIsInBag(3) + ".png"
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            MouseArea {
                anchors.fill: parent;
                onClicked:removeFromBag(3);
            }
        }
        Image{
            id: four;
            y: 292*win.scale;
            anchors.left: parent.left;
            anchors.leftMargin: 4*win.scale;
            source: "img/" + world.whatIsInBag(4) + ".png"
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            MouseArea {
                anchors.fill: parent;
                onClicked:removeFromBag(4);
            }
        }
        Image{
            id: five;
            y: 171*win.scale;
            anchors.left: parent.left;
            anchors.leftMargin: 4*win.scale;
            source: "img/" + world.whatIsInBag(5) + ".png"
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            MouseArea {
                anchors.fill: parent;
                onClicked:removeFromBag(5);
            }
        }
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            gameItem.timeLeft-=1;
            time.text = gameItem.timeLeft.toString();
            if (gameItem.timeLeft <= 5)
                time.color = "red";
            if (gameItem.timeLeft <= 0)
                theEnd();
        }
    }
    Text {
        id: time; text: gameItem.timeLeft.toString();
        anchors.horizontalCenter: parent.horizontalCenter;
        color: "lightcyan";
        font.pixelSize: 60 * win.scale; font.bold: true;
    }

    function pickBag(){
        bagLine.visible = true;
        world.catchBag();
    }
    function bagLibeUpdate(){
        zero.source = "img/" + world.whatIsInBag(0) + ".png";
        one.source = "img/" + world.whatIsInBag(1) + ".png";
        two.source = "img/" + world.whatIsInBag(2) + ".png";
        three.source = "img/" + world.whatIsInBag(3) + ".png";
        four.source = "img/" + world.whatIsInBag(4) + ".png";
        five.source = "img/" + world.whatIsInBag(5) + ".png";
    }
    function pickThing(i){
        world.changeVisible(i);
        world.addToBag(i);
        bagLibeUpdate();
    }
    function removeFromBag(i){
        world.removeFromBag(i);
        bagLibeUpdate();
    }
    function theEnd(){
        mainLd.source = "menu.qml";
    }
}

