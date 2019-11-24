import 'package:flutter/material.dart';
import 'package:project_citas_test/pages/search_delegate.dart';
import 'package:table_calendar/table_calendar.dart';
import 'plantillahomecitatest.dart';
import 'AddNewCita.dart';
import 'TransitionsPage.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  createRoute transition = createRoute(AddCita(), 0.0, 1.0);

  CalendarController _controller;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
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
                  Navigator.of(context).push(transition.createRoutemethod());
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
        body: BodyCita(context, _controller),
        //BottomNavBar()
      ),
    );
  }
}
