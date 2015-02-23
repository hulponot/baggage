import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import MyLib 1.0

ApplicationWindow {
    id: win;
    property double scale: Screen.width/1920 > Screen.height/1080 ? Screen.height/1080 : Screen.width/1920;
    title: qsTr("Baggage")
    width: 1920*scale;
    height: 1080*scale;
    visible: true



    Loader {
        property int whatIsLoaded: 0;
        id: ld;
        source: "room-0.qml"
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

    }

    function pickBag(){
        bagLine.visible = true;
        bag.isCatched = true;
    }

   /* menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
        button3.onClicked: messageDialog.show(qsTr("Button 3 pressed"))
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }*/
}
