import 'package:flutter/material.dart';
import 'package:project_citas_test/pages/MyHomeCita.dart';
import 'package:project_citas_test/pages/home_page.dart';
import 'package:project_citas_test/rutas/rutas.dart';
import 'pages/LoadindPage.dart';
import 'pages/navegationBar.dart';
import 'pages/plantillahomecitatest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Loading(),
      initialRoute: '/',
      routes: obtenerRutas(),
    );
  }
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: test(),
}
