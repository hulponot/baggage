import QtQuick 2.0

Rectangle {
    id: menuOverlay;
    color: "palegreen";
    property int scaledHeight: 100 * win.scale;
    property int scaledWidth: 500 * win.scale;
    Column {
        spacing: 10*win.scale;
        anchors.centerIn: parent;
        Rectangle {
            id: startBut;
            height: menuOverlay.scaledHeight;
            width: menuOverlay.scaledWidth;
            color: "aquamarine"
            border.color: "darkseagreen"; border.width: 3;
            Text {
                id: startText;
                anchors.centerIn: parent;
                text: "Start";
                font.pixelSize: parent.height;
                color: "darkolivegreen";
                font.family: "Impact"
            }
            MouseArea {
                anchors.fill: parent;
                onPressed: colorChangeOnClick(0);
                onReleased: colorChangeOnClick(1);
                onClicked: mainLd.source = "game.qml";
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
                text: "Exit";
                font.pixelSize: parent.height;
                color: "darkolivegreen";
                font.family: "Impact"
            }
            MouseArea {
                anchors.fill: parent;
                onPressed: colorChangeOnClick(2);
                onReleased: colorChangeOnClick(3);
                onClicked: Qt.quit();
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

