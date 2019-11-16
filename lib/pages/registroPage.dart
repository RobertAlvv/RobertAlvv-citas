import 'package:flutter/material.dart';

import 'navegationBar.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Registros',
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: <Widget>[
            Divider(
              height: 3,
              thickness: 2,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
              title: Text(
                'Clientes',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
              title: Text('Especialistas'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(top: 10.0, left: 10, bottom: 10),
              title: Text('Servicios'),
              onTap: () {},
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
