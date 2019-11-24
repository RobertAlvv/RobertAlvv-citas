import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'MyHomeCita.dart';
import 'SenttingsPage.dart';
import 'registroPage.dart';
import 'TransitionsPage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  createRoute transition =
      createRoute(navebar[_selectedIndex]['ruta'], 0.0, 1.0);

  static int _selectedIndex = 0;
  var ruta;

  static List<dynamic> navebar = [
    {'label': 'Citas', 'ruta': MyHome()},
    {'label': 'Registro', 'ruta': RegistroPage()},
    {'label': 'Senttings', 'ruta': SenttingPages()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navebar[_selectedIndex]['ruta'],
//      ruta.hashCode != null
//          ? ruta
//          : Center(
//              child: CircularProgressIndicator(),
//            ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.blueGrey[800],
        selectedIndex: _selectedIndex,
        iconSize: 25,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          //ruta = Navigator.of(context).push(transition.createRoutemethod());
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.perm_contact_calendar),
            title: Text(navebar[0]['label']),
            activeColor: Colors.blueGrey[100],
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text(navebar[1]['label']),
              activeColor: Colors.blueGrey[100]),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text(navebar[2]['label']),
              activeColor: Colors.blueGrey[100]),
        ],
      ),
    );
  }
}
