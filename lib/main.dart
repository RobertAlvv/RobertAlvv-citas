import 'package:flutter/material.dart';
import 'package:project_citas_test/pages/MyHomeCita.dart';
import 'package:project_citas_test/pages/home_page.dart';
import 'package:project_citas_test/rutas/rutas.dart';
import 'pages/LoadindPage.dart';
import 'pages/navegationBar.dart';
import 'pages/plantillahomecitatest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Color hexToColor(int rgb) => new Color(0xFF000000 + rgb);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: hexToColor(0x00897B),
        accentColor: hexToColor(0x00897B),
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme
                .accent //color of the text in the button "OK/CANCEL"
            ),
//        splashColor: hexToColor(0x00897B),
//        unselectedWidgetColor: hexToColor(0x00897B),
//        buttonColor: hexToColor(0x00897B),
//        canvasColor: hexToColor(0x00897B),
//        cardColor: hexToColor(0x00897B),
//        dialogBackgroundColor: hexToColor(0x00897B),
//        cursorColor: hexToColor(0x00897B),
//        disabledColor: hexToColor(0x00897B),
//        dividerColor: hexToColor(0x00897B),
//        errorColor: hexToColor(0x00897B),
//        focusColor: hexToColor(0x00897B),
//        highlightColor: hexToColor(0x00897B),
//        hintColor: hexToColor(0x00897B),
//        hoverColor: hexToColor(0x00897B),
//        indicatorColor: hexToColor(0x00897B),
//        selectedRowColor: hexToColor(0x00897B),
//        toggleableActiveColor: hexToColor(0x00897B),
//        textSelectionHandleColor: hexToColor(0x00897B),
//        textSelectionColor: hexToColor(0x00897B),
//        secondaryHeaderColor: hexToColor(0x00897B),
//        scaffoldBackgroundColor: hexToColor(0x00897B),
//        primaryColorLight: hexToColor(0x00897B),
//        primaryColorDark: hexToColor(0x00897B),
//        backgroundColor: hexToColor(0x00897B),
//
      ),
      debugShowCheckedModeBanner: false,
      home: Loading(),
//      initialRoute: '/',
//      routes: obtenerRutas(),
    );
  }
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: test(),
}
