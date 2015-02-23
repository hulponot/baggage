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

        source: "img/0/room-0.png";
    }

    Image{
        id: bagI;

        x: 560*consts.scale;
        y: 320*consts.scale;

        height: sourceSize.height*0.75*consts.scale;
        width: sourceSize.width*0.75*consts.scale;

        visible: !bag.isCatched;
        source: "img/bag.png"
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                consts.pickBag();
                bagI.visible = false;
            }
        }
    }
}
