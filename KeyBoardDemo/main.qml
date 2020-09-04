import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.VirtualKeyboard 2.14
import QtQuick.VirtualKeyboard.Settings 2.2
import QtQuick.VirtualKeyboard.Styles 2.15

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    Rectangle{
        width: window.width;
        height: inputPanel.y;
        border.width: 1;
        border.color: "red";
        TextEdit{
            height: 200;
            width: 100;
            anchors.margins: 3;
        }
    }



    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width
        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
        Component.onCompleted: {
        }
    }
    Binding {
        target: VirtualKeyboardSettings
        property: "activeLocales"
        value: ["zh_CN","en_US"]
    }
}
