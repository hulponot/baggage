import QtQuick 2.0
import QtQuick.Controls 1.2;

Rectangle {
    signal pickBag();
    color: "bisque";
    width: win.width;
    height: win.height * 2;

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
                Image {
                    source: "img/bag_mountion_stuff.png"
                }
                Image {
                    source: "img/bag_compass.png"
                }
                Image {
                    source: "img/bag_kettle.png"
                }
                Image {
                    source: "img/bag_knife.png"
                }
                Image {
                    source: "img/bag_lucifers.png"
                }
                Image {
                    source: "img/bag_toothBrush.png"
                }
            }

            Image {
                source: "img/jungle.png"
            }
            Row{
                spacing: 5;
                Image {
                    source: "img/bag_antivenom.png"
                }
                Image {
                    source: "img/bag_compass.png"
                }
                Image {
                    source: "img/bag_kettle.png"
                }
                Image {
                    source: "img/bag_knife.png"
                }
                Image {
                    source: "img/bag_lucifers.png"
                }
                Image {
                    source: "img/bag_toothBrush.png"
                }
            }
            Image {
                source: "img/forest.png"
            }
            Row{
                spacing: 5;
                Image {
                    source: "img/bag_holy_water.png"
                }
                Image {
                    source: "img/bag_compass.png"
                }
                Image {
                    source: "img/bag_kettle.png"
                }
                Image {
                    source: "img/bag_knife.png"
                }
                Image {
                    source: "img/bag_lucifers.png"
                }
                Image {
                    source: "img/bag_toothBrush.png"
                }
            }
        }
    }
}

