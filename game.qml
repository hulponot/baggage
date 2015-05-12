import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import MyLib 1.0

Item {
    id: gameItem;

    World{
        id: world;
        levelNum: 0;
    }
    property int timeLeft: 20 - world.levelNum;
    property int level: 0;


    Loader {
        property int whatIsLoaded: 0;
        property string roomTitle: "room-"+gameItem.level;
        anchors.fill: parent;
        id: ld;
        source: "genericRoom.qml"
    }
    Connections {
        target: ld.item
        onPickBag: pickBag();
    }


    MouseArea{
        id: doorKitchen;

        x: 1180*win.scale;
        y: (100)*win.scale;
        width: 315*win.scale;
        height: 450*win.scale;

        onClicked: {
            if (ld.whatIsLoaded == 0){
                ld.roomTitle = "kitchen-"+gameItem.level;
                ld.whatIsLoaded = 1;
                ld.source = "genericKitchen.qml";
                doorKitchen.enabled = false;
                doorRoom.enabled = true;
                doorExit.enabled = false;
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
                ld.roomTitle = "room-"+gameItem.level;
                ld.whatIsLoaded = 0;
                ld.source = "genericRoom.qml";
                doorKitchen.enabled = true;
                doorRoom.enabled = false;
                doorExit.enabled = true;
            }
        }
    }

    MouseArea{
        id: doorExit;

        x: 120*win.scale;
        y: (100)*win.scale;
        width: 315*win.scale;
        height: 470*win.scale;

        onClicked: {
            theEnd();
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
        id: timer;
        interval: 1000; running: true; repeat: true
        onTriggered: {
            gameItem.timeLeft-=1;
            time.text = gameItem.timeLeft.toString();
            if (gameItem.timeLeft <= 5)
                time.color = "red";
            else
                time.color = "lightcyan";
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
    Timer {
        id: baloonTimer;
        interval: 1300; running: false; repeat: false;

        onTriggered: {
            baloons.y = 1060*win.scale;
            container.state = '';
        }
    }

    Item {
        id: container;
        anchors.right: parent.right;
        Image {
            id: baloons;
            anchors.right: parent.right; anchors.rightMargin: 100*win.scale;
            y: 1060*win.scale;
            visible: true;
            height: sourceSize.height*win.scale;
            width: sourceSize.width*win.scale;
            source: "img/baloons.png"
            }
        states: [
            // This adds a second state to the container where the rectangle is farther to the right
            State { name: "flyingUp"
                PropertyChanges {
                    target: baloons
                    y: -800;
                }
            }
        ]
        transitions: [
            // This adds a transition that defaults to applying to all state changes
            Transition {
                // This applies a default NumberAnimation to any changes a state change makes to x or y properties
                NumberAnimation { properties: "y"; duration: 1300;}
            }
        ]
    }
    Rectangle{
        color: "#FFCC99";
        width: 200 * win.scale;
        height: 50 * win.scale;
        Text{
            id: textRecord;
            color: "#FF66CC";
            font.pixelSize: 45 * win.scale;
            text: "Record: " + world.getRecord();
        }
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
        thingsVisibleUpdate();
        bagLibeUpdate();
    }
    function thingsVisibleUpdate(){
        if (ld.whatIsLoaded == 0){
            ld.source = "";
            ld.roomTitle = "room-"+gameItem.level;
            ld.source = "genericRoom.qml";
        }
        else {
            ld.source = "";
            ld.roomTitle = "kitchen-"+gameItem.level;
            ld.source = "genericKitchen.qml";
        }
    }
    function theEnd(){
        world.timeExpired();
        textRecord.text ="Record: " + world.getRecord();
        if (world.getTripTo() != "-1"){

            container.state = 'flyingUp';
            baloonTimer.start();

            ld.source = "";
            ld.source = "genericRoom.qml";
            doorKitchen.enabled = true;
            if (ld.whatIsLoaded == 1){
                ld.source = "genericRoom.qml";
                ld.roomTitle = "room-"+gameItem.level;
                ld.whatIsLoaded = 0;
                doorKitchen.enabled = true;
                doorRoom.enabled = false;
            }

            bagLibeUpdate();
            bagLine.visible = false;
            gameItem.timeLeft = 21 - world.levelNum;
        }
        else {
            timer.stop();
            ld.source = "";
            ld.source = "roundEnd.qml";
        }
    }

}
