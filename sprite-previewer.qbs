import qbs 1.0

Project {
    references: ["libmana/libmana.qbs"]

    CppApplication {
        name: "spritepreviewer"

        Depends {
            name: "Qt"
            submodules: ["quick"]
        }

       /* Depends {
            name: "libmana"
        }*/

        Group {
            name: "C++ Source"
            files: ["main.cpp"]
        }

        Group {
            name: "Binaries"
            qbs.install: true
            qbs.installDir: "bin"
            fileTagsFilter: "application"
        }

        Group {
            name: "QML files"
            qbs.install: true
            qbs.installDir: "share/mana-sprite-viewer/qml/main"
            files: ["qml/main/*.qml"]
        }
    }
}
