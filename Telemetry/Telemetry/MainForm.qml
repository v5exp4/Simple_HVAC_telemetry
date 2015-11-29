import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4

Item {
    anchors.fill: parent
    objectName: "MainForm"

    property alias startButton: startButton
    property alias stopButton: stopButton

    function showMessage(messageText)
    {
        eventLogModel.append({message: messageText});
    }

    RowLayout {
        id: baseGrid
        anchors.fill: parent

        GroupBox
        {
            id: leftGroup
            Layout.fillHeight: true

            ColumnLayout
            {
                id: columnLayout1
                anchors.fill: parent

                Button {
                    id: startButton
                    anchors.topMargin: 10
                    anchors.margins: 5
                    anchors.top: parent.top

                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 130
                            implicitHeight: 40
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#0c0" : "#0e0" }
                                GradientStop { position: 1 ; color: control.pressed ? "#0a0" : "#0c0" }
                            }
                        }

                        label: Text
                        {
                            color: "white"
                            text: "START"
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 12
                            font.bold: true

                        }
                    }
                }

                Button {
                    id: stopButton
                    anchors.top: startButton.bottom
                    anchors.topMargin: 10
                    anchors.margins: 30

                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 130
                            implicitHeight: 40
                            border.width: control.activeFocus ? 2 : 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0 ; color: control.pressed ? "#d00" : "#f00" }
                                GradientStop { position: 1 ; color: control.pressed ? "#b00" : "#d00" }
                            }
                        }

                        label: Text
                        {
                            color: "white"
                            text: "STOP"
                            anchors.centerIn: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 12
                            font.bold: true
                        }
                    }
                }

                Text {
                    id: messagesLabel
                    text: "Üzenetek:"
                    anchors.left: parent.left
                    anchors.top: stopButton.bottom
                    anchors.topMargin:30
                    anchors.leftMargin: 5
                    font.bold: true
                }

                Rectangle{
                    Layout.fillHeight: true

                    anchors.margins: 10
                    anchors.top: messagesLabel.bottom
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0

                    implicitWidth: 240

                    color: "white"
                    border.width: 1
                    border.color: "black"

                    ScrollView
                    {
                        anchors.fill: parent
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        Layout.minimumWidth: 250
                        Layout.preferredWidth: 150
                        Layout.maximumWidth: 250
                        Layout.minimumHeight: 250

                        anchors.top: parent.top
                        anchors.topMargin: 3

                        ListView
                        {
                            id: eventLog
                            anchors.fill: parent

                            spacing: 3

                            delegate: Component {

                                Row {
                                    anchors.left: parent.left
                                    anchors.margins: 10
                                    Text {
                                        text: message
                                        anchors.verticalCenter: parent.verticalCenter
                                        horizontalAlignment: Text.AlignLeft
                                    }
                                }
                           }
                            model: ListModel { id: eventLogModel }

                            onCountChanged: {
                                eventLog.currentIndex = eventLog.count - 1;
                            }
                        }
                    }
                }
            }
        }

        GroupBox
        {
            id: middleGroup
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout
        {
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: middleGroup.right

            GroupBox
            {
                title: "Temperatures"

                ColumnLayout
                {
                    RowLayout
                    {
                        id: tempRadioButtons
                        Layout.fillWidth: true

                        anchors.bottom: historyGraphTemperature.top

                        RadioButton
                        {
                            id: selectTemp1
                            text: "Temp1"
                            checked: true

                            onClicked:
                            {
                                historyGraphTemperature.showTemp1 = !historyGraphTemperature.showTemp1;
                                historyGraphTemperature.requestPaint();
                            }
                        }
                        RadioButton
                        {
                            id: selectTemp2
                            text: "Temp2"
                            checked: true


                            onClicked:
                            {
                                historyGraphTemperature.showTemp2 = !historyGraphTemperature.showTemp2;
                                historyGraphTemperature.requestPaint();
                            }
                        }
                        RadioButton
                        {
                            id: selectTemp3
                            text: "Temp3"
                            checked: true


                            onClicked:
                            {
                                historyGraphTemperature.showTemp3 = !historyGraphTemperature.showTemp3;
                                historyGraphTemperature.requestPaint();
                            }
                        }
                        RadioButton
                        {
                            id: selectTemp4
                            text: "Temp4"
                            checked: true


                            onClicked:
                            {
                                historyGraphTemperature.showTemp4 = !historyGraphTemperature.showTemp4;
                                historyGraphTemperature.requestPaint();
                            }
                        }
                    }

                    HistoryGraphTemperature {
                        id: historyGraphTemperature
                        anchors.bottom: graphsPlaceholder.top
                        width: 300
                        height: 220
                        objectName: "historyGraphTemperature"

                        Layout.fillWidth: true
                        Layout.minimumWidth: 200
                        Layout.preferredWidth: 400
                        Layout.minimumHeight: 150

                        graphVelocities: historyGraphVelocity

                        graphTemperatures1: historyGraphTemperatures1
                        graphTemperatures2: historyGraphTemperatures2
                        graphTemperatures3: historyGraphTemperatures3
                        graphTemperatures4: historyGraphTemperatures4
                    }

                    Item
                    {
                        id: graphsPlaceholder
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        anchors.bottom: parent.bottom
                    }
                }
            }
        }
    }
}
