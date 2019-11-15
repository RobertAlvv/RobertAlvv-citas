import 'package:flutter/material.dart';

class AddCita extends StatefulWidget {
  @override
  _AddCitaState createState() => _AddCitaState();
}

class _AddCitaState extends State<AddCita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 22,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.blueGrey[700], Colors.blueGrey[500]],
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Nueva Cita'.toUpperCase()),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                //decoration: BoxDecoration(),
                height: 40,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Cliente'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              //decoration: BoxDecoration(),
              height: 60,
              width: double.infinity,
              color: Colors.grey[300],
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: TextField(
                      //enabled: false,
                      decoration: InputDecoration.collapsed(hintText: null),
                    ),
                    trailing: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                //decoration: BoxDecoration(),
                height: 70,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        height: 40,
                        width: 35,
                        child: Icon(
                          Icons.event_note,
                          size: 40,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Fecha'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              //decoration: BoxDecoration(),
              height: 60,
              width: double.infinity,
              color: Colors.grey[300],
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: TextField(
                      //enabled: false,
                      decoration: InputDecoration.collapsed(hintText: null),
                    ),
                    trailing: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                //decoration: BoxDecoration(),
                height: 40,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        child: Icon(
                          Icons.recent_actors,
                          size: 40,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Especialista'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              //decoration: BoxDecoration(),
              height: 60,
              width: double.infinity,
              color: Colors.grey[300],
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: TextField(
                      //enabled: false,
                      decoration: InputDecoration.collapsed(hintText: null),
                    ),
                    trailing: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                //decoration: BoxDecoration(),
                height: 40,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        child: Icon(
                          Icons.view_list,
                          size: 40,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Servicios'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              //decoration: BoxDecoration(),
              height: 60,
              width: double.infinity,
              color: Colors.grey[300],
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: TextField(
                      //enabled: false,
                      decoration: InputDecoration.collapsed(hintText: null),
                    ),
                    trailing: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 210),
                  child: RaisedButton(
                    child: Text('GUARDAR'),
                    onPressed: () {},
                    hoverColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Container(
                  child: RaisedButton(
                    child: Text('CANCELAR'),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
