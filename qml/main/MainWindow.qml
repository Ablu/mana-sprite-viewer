import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow {
    id: window;

    width: 600;
    height: 600;

    Component.onCompleted: { resourceManager.dataUrl = resourceDir; }

    Connections {
        target: resourceManager
        onPathsLoadedChanged: {
            if (resourceManager.pathsLoaded === true) {
                content.createObject(window, {});
            }
        }
    }

    Component {
        id: content

        SpritePreviewer {}
    }
}
