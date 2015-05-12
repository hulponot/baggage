import QtQuick 2.0
import QtQuick.Controls 1.2;

Rectangle {
    signal pickBag();
    color: "bisque";
    width: win.width;
    height: win.height * 2;



    ScrollView{
        anchors.fill: parent;
        anchors.top: parent.top; anchors.topMargin: 80*win.scale;
        Column{
            anchors.left: parent.left;
            anchors.leftMargin: 200;
            spacing: 10;
            Image {
                source: "img/mountion.png"
            }
            Row{
                spacing: 5;
                property int roomNum: 0;
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,0) + ".png"
                }
                Image {
                    source: "img/"+world.getLvlNeeds(parent.roomNum,1) +".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,2) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,3) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,4) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,5) + ".png"
                }
            }

            Image {
                source: "img/jungle.png"
            }
            Row{
                spacing: 5;
                property int roomNum: 1;
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,0) + ".png"
                }
                Image {
                    source: "img/"+world.getLvlNeeds(parent.roomNum,1) +".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,2) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,3) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,4) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,5) + ".png"
                }
            }
            Image {
                source: "img/forest.png"
            }
            Row{
                spacing: 5;
                property int roomNum: 2;
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,0) + ".png"
                }
                Image {
                    source: "img/"+world.getLvlNeeds(parent.roomNum,1) +".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,2) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,3) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,4) + ".png"
                }
                Image {
                    source: "img/" + world.getLvlNeeds(parent.roomNum,5) + ".png"
                }
            }
        }
    }
    Button{
        anchors.right: parent.right; anchors.rightMargin: 30;
        anchors.top: parent.top; anchors.topMargin: 80*win.scale;
        text: "Back";
        height: 200*win.scale;
        onClicked: {
            doorRoom.enabled = true;
            ld.source = "genericKitchen.qml";
        }
    }
}

