import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 800
    height: 400
    visible: true
    title: qsTr("Форма регистрации для подбора пары")

    function search() {
        console.log("You name ", yName.text)
        console.log("You sex ", ySex.currentText)
        console.log("You age ", yAge.text) //
        console.log("You teach ", yTeach.currentIndex)
        console.log("You hobby ", yHobby.text)
        console.log("You city ", yCity.text)
        console.log("You info ", yInfo.text)
        console.log("---------------------")
        console.log("Partner age", minAge.text, "-", maxAge.text)
        console.log("Partner sex ", pSex.currentText)
        console.log("Partner teach", pTeach.currentIndex)
    }

    ListModel {
        id: sex
        ListElement { key: "Man"; value: "M" }
        ListElement { key: "Female"; value: "F" }
    }

    ListModel {
        id: teach
        ListElement { key: "Остутствует"; value: 0 }
        ListElement { key: "Начальное"; value: 1 }
        ListElement { key: "Среднее"; value: 2 }
        ListElement { key: "Среднее специальное"; value: 3 }
        ListElement { key: "Высшее"; value: 4 }
        ListElement { key: "Высшее техническое"; value: 5 }
    }

GridLayout {
    id: grid
    columns: 5
 //   rows: 5

    Text {
//        id: data
        text: "Ваши данные"
        font.pointSize: 24
        font.family: "Courier"
        font.italic: true
        font.bold: true

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.column: 0
                    Layout.columnSpan: 2
//                    Layout.row: 0
//                    Layout.rowSpan: 3
    }

     Text {
//         id: search
         text: "Параметры для поиска"
         font.pointSize: 24
         font.family: "Courier"
         font.italic: true
         font.bold: true

         Layout.fillHeight: true
         Layout.fillWidth: true
         Layout.column: 2
         Layout.columnSpan: 3
//         Layout.row: 0
//         Layout.rowSpan: 3
     }

    Text { text: "Имя "; font.bold: true; }

    TextField {
         id: yName
         placeholderText: "Как Вас зовут?"

         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
//         Layout.fillHeight: true
//         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: "Возраст "; font.bold: true; }

    TextField {
         id: minAge
         placeholderText: "Мин.возраст?"
         validator: RegExpValidator { regExp: /(?:[1-9])?(?:[1-9]|0)/ }
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
//         Layout.fillHeight: true
//         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    TextField {
         id: maxAge
         placeholderText: "Макс.возраст?"
         validator: RegExpValidator { regExp: /(?:[1-9])?(?:[1-9]|0)/ }
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
//         Layout.fillHeight: true
//         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: "Пол "; font.bold: true; }

//    TextField {
      ComboBox {
         id: ySex
         textRole: "key"
         background: Rectangle {
             color:"white"
             border.width: parent && parent.activeFocus ? 2 : 1
             border.color: parent && parent.activeFocus ? ySex.palette.highlight : ySex.palette.button
         }
        model: sex

         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
         Layout.fillHeight: true
         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: "Пол "; font.bold: true; }

    ComboBox {
         id: pSex
//         placeholderText: "Пол партнера?"
         textRole: "key"
         background: Rectangle {
             color:"white"
             border.width: parent && parent.activeFocus ? 2 : 1
             border.color: parent && parent.activeFocus ? pSex.palette.highlight : pSex.palette.button
         }
         model: sex
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
         Layout.fillHeight: true
         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: " "}

    Text { text: "Возраст "; font.bold: true; }

    TextField {
         id: yAge
         placeholderText: "Сколько Вам лет?"
         validator: RegExpValidator { regExp: /(?:[1-9])?(?:[1-9]|0)/ }
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
//         Layout.fillHeight: true
//         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: "Образование "; font.bold: true; }

//    TextField {
    ComboBox {
         id: pTeach
//         placeholderText: "партнера?"
         textRole: "key"
         background: Rectangle {
             color:"white"
             border.width: parent && parent.activeFocus ? 2 : 1
             border.color: parent && parent.activeFocus ? pTeach.palette.highlight : pTeach.palette.button
         }
         model: teach
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
         Layout.fillHeight: true
         Layout.fillWidth: true
//         Layout.column: 3
         Layout.columnSpan: 1
//         Layout.row: 3
//         Layout.rowSpan: 3
    }

    Text { text: " "; font.bold: true; Layout.columnSpan: 1;}
    Text { text: "Образование "; font.bold: true; }

//    TextField {
    ComboBox {
         id: yTeach
//         placeholderText: "Ваш уровень?"
         textRole: "key"
         background: Rectangle {
             color:"white"
             border.width: parent && parent.activeFocus ? 2 : 1
             border.color: parent && parent.activeFocus ? yTeach.palette.highlight : yTeach.palette.button
         }
         model: teach
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
         Layout.fillHeight: true
         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: " "; font.bold: true; Layout.columnSpan: 3;}

    Text { text: "Хобби "; font.bold: true; }

    TextField {
         id: yHobby
         placeholderText: "Чем увлекаетесь?"

         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
//         Layout.fillHeight: true
//         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: " "; font.bold: true; Layout.columnSpan: 3;}

    Text { text: "Город "; font.bold: true; }

    TextField {
         id: yCity
         placeholderText: "Где живете?"

         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
//         Layout.fillHeight: true
//         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: " "; font.bold: true; Layout.columnSpan: 3;}

    Text { text: "О себе "; font.bold: true; }

    TextField {
//    TextEdit {
         id: yInfo
         placeholderText: "Ваши качества?"
         font.pointSize: 14
         font.family: "Courier"
         font.italic: true
         font.bold: true
         Layout.fillHeight: true
         Layout.fillWidth: true
//         Layout.column: 0
//         Layout.columnSpan: 3
//         Layout.row: 1
//         Layout.rowSpan: 3
    }

    Text { text: " "; font.bold: true; Layout.columnSpan: 3;}

    Text { text: " "; font.bold: true; Layout.columnSpan: 2;}

    Button {
        id: searchButton
        font.pointSize: 14
        font.family: "Courier"
        font.bold: true
         background: Rectangle {
              color: parent.down ? "#bbbbbb" :
                      (parent.hovered ? "#d6d6d6" : "#f6f6f6")
              }
         text: "Поиск"
         onClicked: search()
     }

        Text { text: " "; font.bold: true; Layout.columnSpan: 2;}

}
}
