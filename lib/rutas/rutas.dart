import 'package:flutter/material.dart';
import 'package:project_citas_test/pages/LoadindPage.dart';
import 'package:project_citas_test/pages/MyHomeCita.dart';
import 'package:project_citas_test/pages/SenttingsPage.dart';
import 'package:project_citas_test/pages/navegationBar.dart';
import 'package:project_citas_test/pages/registroPage.dart';

Map<String, WidgetBuilder> obtenerRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => Loading(),
    'homeCita': (BuildContext context) => BottomNavBar(),
    'Senttings': (BuildContext context) => SenttingPages(),
    'RegistroPage': (BuildContext context) => RegistroPage(),
  };
}
