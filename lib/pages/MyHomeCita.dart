import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:project_citas_test/pages/search_delegate.dart';
import 'package:table_calendar/table_calendar.dart';
import 'SenttingsPage.dart';
import 'navegationBar.dart';
import 'plantillahomecitatest.dart';
import 'AddNewCita.dart';
import 'package:page_transition/page_transition.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 1300),
      pageBuilder: (context, animation, secondaryAnimation) => AddCita(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.linearToEaseOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }


  CalendarController _controller;
  int _selectedIndex = 0;

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
                  Navigator.of(context).push(_createRoute());
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
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
                    onPressed: () {
                      showSearch(context: context, delegate: Search());
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Buscar'.toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search, color: Colors.white),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        body: _getContentWidget(),
        bottomNavigationBar: BottomNavBar()
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
}
