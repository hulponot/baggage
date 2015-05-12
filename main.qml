import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import MyLib 1.0
import QtMultimedia 5.0

ApplicationWindow {
    id: win;
    property double scale: Screen.width/1920 > Screen.height/1080 ? Screen.height/1080 : Screen.width/1920;
    property bool silence: false;
    title: qsTr("Baggage")
    width: 1920*scale;
    height: 1080*scale;
    visible: true

    Audio {
        id: music;
        source: "wav/lokomotiv.mp3"
        loops: Audio.Infinite;
    }

    Loader {
        id: mainLd;
        source: "menu.qml";
        anchors.fill: parent;
    }
}
