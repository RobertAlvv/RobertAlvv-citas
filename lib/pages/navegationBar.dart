import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatelessWidget{

  int _selectedIndex;
  List<dynamic> navebar = [
    {'label': 'Citas','ruta':'homeCita', 'id': 0},
    {'label': 'Registro','ruta':'RegistroPage', 'id': 1},
    {'label': 'Senttings','ruta':'Senttings', 'id': 2}
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
          backgroundColor: Colors.blueGrey[800],
          selectedIndex: _selectedIndex,
          iconSize: 25,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => Navigator.pushNamed(context, navebar[index]['ruta']),
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
        );

  }

  }