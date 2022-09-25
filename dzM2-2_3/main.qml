import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property int clickNum: 0
    property var mk : Qt.LeftButton

    Timer{
        id: clickTimer
        interval: 300;
        onTriggered: {
            clickNum = 0
            clickTimer.stop()
            if (mk === Qt.RightButton) {
                console.log("right button clicked!")
                seq.access.target = square
                seq.access.property = "radius"
                seq.access.duration = 1000
                if (square.radius === 100) {
                    seq.access.to = 0
                } else {
                    seq.access.to = 100
                }
                seq.start()
            } else if (mk === Qt.LeftButton) {
                console.log("left button clicked!")
                square.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
            }
        }
    }

    SequentialAnimation {
        id: seq
        property alias access: num
        NumberAnimation{id: num}
    }

    Rectangle {
        id: square
        width: 100
        height: 100
        color: "blue"
        radius: 0
        anchors.centerIn: parent
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter

//        states: State {
//            name: "rotated"
//            PropertyChanges { target: square; rotation: 10 }
//        }

//        transitions: Transition {
//            RotationAnimation { duration: 100; direction: RotationAnimation./*Clockwise*/Counterclockwise }
//                //properties: "angle"; from: 0; to: 360; duration: 2000}
//        }

        transform:
            Rotation {
                id: zzRot
                origin.x: 50; origin.y: 50;
                angle: 0
            }

        NumberAnimation {
            id: sRot
            running: false
            target: zzRot;
            property: "angle";
            from: 0; to: 360;
            duration: 4000;
        }


        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            hoverEnabled: true

            onClicked: {
                clickNum ++
                if(clickNum == 1)
                {
                    mk = mouse.button
                    clickTimer.start()
                }
                if(clickNum == 2)
                {
                    clickNum = 0
                    clickTimer.stop()
                    console.log("doubleClicked, doubleClicked,doubleClicked")
//                    square.state = "rotated"
                    sRot.start()
                }
            }
        }

    }

    // mad square
//    Rectangle {
//        width: 70; height: 70
//        anchors.centerIn: parent
//        color: "#00FF00"
//        Rectangle {
//            color: "#FF0000"
//            width: 10; height: 10
//            anchors.top: parent.top
//            anchors.right: parent.right
//        }

//        transform: [
//            Rotation {
//                id: zRot
//                origin.x: 35; origin.y: 35;
//                angle: 0
//            },
//            Rotation {
//                id: xRot
//                origin.x: 35; origin.y: 35;
//                angle: 45
//                axis { x: 1; y: 0; z: 0 }
//            },
//            Rotation {
//                id: yRot
//                origin.x: 35; origin.y: 35;
//                angle: 60
//                axis { x: 0; y: 1; z: 0 }
//            }
//        ]
//        NumberAnimation {
//            running: true
//            loops: 100
//            targets: [xRot, yRot, zRot];
//            property: "angle";
//            from: 0; to: 360;
//            duration: 4000;
//        }
//    }

}
