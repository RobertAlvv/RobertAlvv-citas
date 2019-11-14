import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'SenttingsPage.dart';
import 'plantillahomecitatest.dart';
import 'AddNewCita.dart';
import 'package:page_transition/page_transition.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<dynamic> navebar = [
    {'Nombre': 'Citas', 'id': 0},
    {'Nombre': 'Clientes', 'id': 1},
    {'Nombre': 'Senttings', 'id': 2}
  ];

  CalendarController _controller;
  int _selectedIndex = 0;
  var _pageController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topRight,
            stops: [
              0.05,
              0.6,
              0.8,
              0.9
            ],
            colors: [
              Colors.blueGrey[800],
              Colors.blueGrey[700],
              Colors.blueGrey[600],
              Colors.blueGrey[600],
            ]),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  _showBottomSheet();
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white70,
                ),
              )),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey[800].withOpacity(0.4),
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 0.9,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Buscar'.toUpperCase(),
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search, color: Colors.white70),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        body: _getContentWidget(),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.blueGrey[800],
          selectedIndex: _selectedIndex,
          iconSize: 25,
          showElevation: false, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            print(index);
//            _pageController.animateToPage(index,
//                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.perm_contact_calendar),
              title: Text(navebar[0]['Nombre']),
              activeColor: Colors.blueGrey[100],
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text(navebar[1]['Nombre']),
                activeColor: Colors.blueGrey[100]),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text(navebar[2]['Nombre']),
                activeColor: Colors.blueGrey[100]),
          ],
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    switch (_selectedIndex) {
      case 0:
        return BodyCita(context, _controller);
      case 1:
        return SenttingPages();

      default:
        return Center(
            child: Text(
          "Error",
          style: TextStyle(fontSize: 32.0, color: Colors.red),
        ));
    }
  }

  _showBottomSheet() {
    _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 40),
                    child: Text(
                      'NUEVA CITA',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Cliente',
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'Nombre del cliente',
                  suffixIcon: Icon(Icons.add_circle),
                ),
                onChanged: (valor) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Doctor',
                  prefixIcon: Icon(Icons.perm_contact_calendar),
                  hintText: 'Nombre del doctor',
                  suffixIcon: Icon(Icons.search),
                ),
                onChanged: (valor) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Cliente',
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'Nombre del cliente',
                  suffixIcon: Icon(Icons.add_circle),
                ),
                onChanged: (valor) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Cliente',
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'Nombre del cliente',
                  suffixIcon: Icon(Icons.add_circle),
                ),
                onChanged: (valor) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  labelText: 'Cliente',
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'Nombre del cliente',
                  suffixIcon: Icon(Icons.add_circle),
                ),
                onChanged: (valor) {
                  setState(() {});
                },
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('GUARDAR'),
                  onPressed: () {},
                  hoverColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                RaisedButton(
                  child: Text('CANCELAR'),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }).closed;
  }
}
