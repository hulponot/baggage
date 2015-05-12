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
                onClicked: {
                    if (!win.silence)
                        music.play();
                    mainLd.source = "tutor.qml";
                }
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
    Image {
        anchors.left: parent.left; anchors.leftMargin: 39*win.scale;
        anchors.top: parent.top; anchors.topMargin: 42 * win.scale;
        source: !win.silence ? "img/music_on.png":"img/music_off.png";
        height: sourceSize.height*0.75*win.scale;
        width: sourceSize.width*0.75*win.scale;
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if (win.silence) parent.source = "img/music_on.png";
                else parent.source = "img/music_off.png";
                win.silence = win.silence ? false : true;
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

