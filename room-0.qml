import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Item{
    id: consts;
property double scale: Screen.width/1920 > Screen.height/1080 ? Screen.height/1080 : Screen.width/1920;
    Image {
        id: bg;
        width: 1920*consts.scale;
        height: 1080*consts.scale;

        source: "img/0/room-0.png";
    }


}
