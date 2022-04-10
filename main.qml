import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property  var len: 0
    Rectangle {
        id: button
        width: 100
        height: 60
        radius: 10
        color: "black"
        MouseArea {
            anchors.fill: parent
            onClicked: {
                timer.running = true
            }
        }
        anchors {
            left: parent.left
            leftMargin: 200
            top: parent.top
            topMargin: 200
        }
    }

    Text {
        id: text
        z: 3
        font.pixelSize: 12
        font.weight: Font.Normal
        color: "#FFFFFF"
        text: "submit"
        x: 230
        y: 224
    }

    Image {
        id: gou
        source: "qrc:/gougou.png"
        opacity: 0
        anchors {
            verticalCenter: button.verticalCenter
            horizontalCenter: button.horizontalCenter
        }
    }

    Rectangle {
         id: shader
         //visible: false
         width: len
         height: 60
         radius: 10
         color: "#BBBCBC"
         z: 1
         anchors {
             left: parent.left
             leftMargin: 200
             top: parent.top
             topMargin: 200
         }
     }

     Timer {
         id: timer
         interval: 500; running: false; repeat: true
         onTriggered: {
             console.log("...............")
             if (len == 100)
             {
                 timer.running = false
                 len = 0
                 showText.running = false
                 hideText.running = true
                 console.log("----------")
//                 gou.visible = true
                 hideGou.running = false
                 showGou.running = true
                 console.log("----------")
                 //pause.running = true
                 time2.running = true
                 return
             }
             len += 10
         }
     }

     Timer {
         id: time2
         interval: 400; running: false; repeat: true
         onTriggered: {
            time2.running = false
            //gou.visible = false
            showGou.running = false
            hideGou.running = true
            hideText.running = false
            showText.running = true
         }
     }

     PropertyAnimation {
         id: hideText
         running: false
         target: text
         duration: 300
         property: "y"
         to: -2
     }


     PropertyAnimation {
         id: showText
         running: false
         target: text
         duration: 250
         property: "y"
         to: 224
     }

     PropertyAnimation {
         id: hideGou
         running: false
         target: gou
         duration: 300
         property: "opacity"
         to: 0
     }


     PropertyAnimation {
         id: showGou
         running: false
         target: gou
         duration: 1000
         property: "opacity"
         to: 1
     }

     PauseAnimation {id:pause;running:false;duration: 1200}

//     SequentialAnimation {
//         id: ani
//         ScriptAction {script: {s1.restart() } }
//         PauseAnimation {duration: 1200}
//         ScriptAction {script: {s2.restart() } }
//     }
 }
