import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';

import 'MyHomeCita.dart';
import 'SenttingsPage.dart';
import 'registroPage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  var _pageController;

  List<Widget> _body = [
    MyHome(),
    RegistroPage(),
    SenttingPages(),
  ];

  List<dynamic> navebar = [
    {'label': 'Citas', 'ruta': MyHome(), 'id': 0},
    {'label': 'Registro', 'ruta': RegistroPage(), 'id': 1},
    {'label': 'Senttings', 'ruta': SenttingPages(), 'id': 2}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navebar[_selectedIndex]['ruta'],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.blueGrey[800],
        selectedIndex: _selectedIndex,
        iconSize: 25,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
//        _pageController.animateToPage(index,
//            duration: Duration(milliseconds: 300), curve: Curves.ease);
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
