import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    property string icon_lb: "file:///E:/radioicon/leftB.png";
    property string icon_lo: "file:///E:/radioicon/leftO.png";
    property string icon_rb: "file:///E:/radioicon/rightB.png";
    property string icon_ro: "file:///E:/radioicon/rightO.png";
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Column{
        x: 200;
        y: 200;
        anchors.verticalCenterOffset: -150
        anchors.horizontalCenterOffset: -150
        anchors.centerIn: parent;
    Rectangle {

        width: 150
        height: 30
        Text {
            id: txt_box
            text: "95.7"
            font.pointSize: 12
            anchors.centerIn: parent
        }

        border.color: "black"
        border.width: 2
//        anchors.verticalCenterOffset: -150
//        anchors.horizontalCenterOffset: 0
//        anchors.centerIn: parent
    }
    Slider{
        id: slider_1
        x: 50
        y: 350
//        anchors.verticalCenterOffset: -300
//        anchors.horizontalCenterOffset: -200
//        anchors.centerIn: parent
        from: 1
        to: 150
        value: txt_box.text
        onMoved:{
              //txt_box.text = slider_1.value;
            if(slider_1.value>txt_box.text){
                myapp.func_btn_inc();
            } else {
                myapp.func_btn_dec();
            }
        }
    }
    Row{

    Button{
        id: btn_1
        width: 80;
        height: 80;
        background: Image
        {
            source: btn_1.pressed? icon_lo : icon_lb;
        }
        onClicked:
        {
            myapp.func_btn_dec()
        }
        //anchors.fill: parent;
    }


    Button{
        id: btn_2
        width: 80;
        height: 80;
        background: Image
        {
            source: btn_2.pressed? icon_ro : icon_rb;
        }
        onClicked:
        {
            myapp.func_btn_inc()
        }
       // anchors.centerIn: parent;

    }

    }
    }
    Column{
        x: 50;
        y: 80;
        anchors.verticalCenterOffset: -150
        anchors.horizontalCenterOffset: 100
        anchors.centerIn: parent;
        RadioButton{
            checked: false
            text: qsTr("Off")
            font.pointSize: 12
            onClicked:
            {
                myapp.func_btn_off()
            }
        }
        RadioButton{
                checked: true
                text: qsTr("CH1")
                font.pointSize: 12
                onClicked:
                {
                    myapp.func_btn_ch1()
                }
        }
        RadioButton{
                    checked: false
                    text: qsTr("CH2")
                    font.pointSize: 12
                    onClicked: {
                        myapp.func_btn_ch2()
                    }
        }
        RadioButton{
                    checked: false
                    text: qsTr("CH3")
                    font.pointSize: 12
                    onClicked: {
                        myapp.func_btn_ch3()
                    }
        }
        Connections
        {
            target:myapp
            ignoreUnknownSignals: true

            function onSendMess(text_box_str)
            {
                txt_box.text = text_box_str;
            }

        }

    }

}
