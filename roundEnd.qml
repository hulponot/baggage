import QtQuick 2.0

Rectangle {
    id: menuOverlay;
    signal pickBag();
    color: "palegreen";
    property int scaledHeight: 100 * win.scale;
    property int scaledWidth: 500 * win.scale;
    Column {
        spacing: 10*win.scale;
        anchors.centerIn: parent;
        Rectangle {
            height: menuOverlay.scaledHeight;
            width: menuOverlay.scaledWidth;
            color: "palegreen";
            Text {
                anchors.centerIn: parent;
                text: "FAIL on " + (world.levelNum + 1);
                font.pixelSize: parent.height;
                color: "darkolivegreen";
                font.family: "Impact"
            }
        }

        Rectangle {
            id: exitBut;
            height: menuOverlay.scaledHeight;
            width: menuOverlay.scaledWidth;
            color: "aquamarine"
            border.color: "darkseagreen"; border.width: 3;
            Text {
                id: exitText;
                anchors.centerIn: parent;
                text: "MENU";
                font.pixelSize: parent.height;
                color: "darkolivegreen";
                font.family: "Impact"
            }
            MouseArea {
                anchors.fill: parent;
                onPressed: colorChangeOnClick(2);
                onReleased: colorChangeOnClick(3);
                onClicked:{
                    music.stop();
                    mainLd.source = "menu.qml";
                }
            }
        }
    }

    function colorChangeOnClick(i){
        switch(i){
        case 0:
            startBut.color = "darkolivegreen";
            startText.color = "white";
            break;
        case 1:
            startBut.color = "aquamarine";
            startText.color = "darkolivegreen";
            break;
        case 2:
            exitBut.color = "darkolivegreen";
            exitText.color = "white";
            break;
        case 3:
            exitBut.color = "aquamarine";
            exitText.color = "darkolivegreen";
            break;
        default:
        }
    }
}
