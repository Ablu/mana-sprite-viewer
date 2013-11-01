import QtQuick 2.0
import QtQuick.Controls 1.0

import Mana 1.0

Rectangle {
    anchors.fill: parent;

    Column {
        id: sidebar

        spacing: 10

        width: 300;

        anchors.right: parent.right;

        Text {
            text: "Sprite Previewer"
            font.bold: true
        }

        Text {
            text: "previewing:"
        }

        Column {
            Repeater {
                model: spriteFiles
                Text {
                    text: modelData
                }
            }
        }

        Row {
            spacing: 5

            Text {
                text: "action:"
            }
            TextField {
                id: actionInput
                text: "stand"
            }
        }

        Button {
            width: parent.width;

            text: "stand"
            onClicked: {
                actionInput.text = "";
                actionInput.text = "stand";
            }
        }

        Button {
            width: parent.width;

            text: "walk"
            onClicked: {
                actionInput.text = "";
                actionInput.text = "walk";
            }
        }

        Button {
            width: parent.width;

            text: "attack"
            onClicked: {
                actionInput.text = "";
                actionInput.text = "attack";
            }
        }

        Column {
            id: directionControl
            property int direction: Action.DIRECTION_DOWN

            width: parent.width
            spacing: 5

            Button {
                x: parent.width / 2 - width / 2

                text: "Up"

                onClicked: {
                    directionControl.direction = 1
                }
            }

            Item {
                width: parent.width;
                height: buttonLeft.height

                Button {
                    id: buttonLeft

                    anchors.left: parent.left;

                    text: "Left"

                    onClicked: {
                        directionControl.direction = 3
                    }
                }

                Button {
                    anchors.right: parent.right;

                    text: "Right"

                    onClicked: {
                        directionControl.direction = 4
                    }
                }
            }

            Button {
                x: parent.width / 2 - width / 2

                text: "Down"

                onClicked: {
                    directionControl.direction = 2
                }
            }
        }

    }
    Item {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: sidebar.left
        anchors.bottom: parent.verticalCenter

        Repeater {
            model: spriteFiles
            delegate: Item {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                SpriteReference {
                    id: spriteRef;
                    sprite: modelData
                }

                Sprite {
                    id: sprite
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom

                    direction: directionControl.direction
                    action: actionInput.text

                    // work around asynchron creation of objects
                    spriteReference: spriteRef.sprite === modelData ? spriteRef : null;
                }
            }
        }
    }
}
