import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ClientesPage.dart';
import 'TransitionsPage.dart';
import 'EspecialistasPage.dart';
import 'ServiciosPages.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  var page = 0;
  static final pageNextRegistro = [
    {'page': MyClientes()},
    {'page': MyEspecialistas()},
    {'page': MyServicios()}
  ];

  createRoute transitions = createRoute(pageNextRegistro[0]['page'], 0.0, 1.0);
  createRoute transitions1 = createRoute(pageNextRegistro[1]['page'], 0.0, 1.0);
  createRoute transitions2 = createRoute(pageNextRegistro[2]['page'], 0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.centerLeft,
            stops: [
              0.3,
              0.9,
            ],
            colors: [
              //Colors.blueGrey[800],
              Colors.blueGrey[500],
              Colors.blueGrey[700],
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.blueGrey[700], Colors.blueGrey[500]],
              ),
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 8),
                child: Text(
                  'Registro'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Card(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    height: 70,
                    child: ListTile(
                      onTap: () {
                        page = 0;
                        Navigator.of(context)
                            .push(transitions.createScaleRouteMethod());
                      },
                      contentPadding: EdgeInsets.only(top: 6, left: 14),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blueGrey.withOpacity(0.7),
                        child: Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Clientes'.toUpperCase(),
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Colors.blueGrey[700],
                          Colors.blueGrey[500]
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  height: 70,
                  child: ListTile(
                    onTap: () {
                      page = 1;
                      Navigator.of(context)
                          .push(transitions1.createScaleRouteMethod());
                    },
                    contentPadding: EdgeInsets.only(top: 6, left: 14),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey.withOpacity(0.7),
                      child: Icon(
                        Icons.recent_actors,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Especialistas'.toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.blueGrey[700],
                        Colors.blueGrey[500]
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  height: 70,
                  child: ListTile(
                    onTap: () {
                      page = 2;
                      Navigator.of(context)
                          .push(transitions2.createScaleRouteMethod());
                    },
                    contentPadding: EdgeInsets.only(top: 6, left: 14),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey.withOpacity(0.7),
                      child: Icon(
                        Icons.view_list,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Servicios'.toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.blueGrey[700],
                        Colors.blueGrey[500]
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  height: 70,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text('Advertencia'.toUpperCase()),
                          content:
                              Text('Estamos trabajando aun en esta seccion'),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.only(top: 6, left: 14),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey.withOpacity(0.7),
                      child: Icon(
                        Icons.view_week,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Productos'.toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.warning,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.blueGrey[700],
                        Colors.blueGrey[500]
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Card(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  height: 70,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text('Advertencia'.toUpperCase()),
                          content:
                              Text('Estamos trabajando aun en esta seccion'),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.only(top: 6, left: 14),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blueGrey.withOpacity(0.7),
                      child: Icon(
                        Icons.insert_chart,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Reportes'.toUpperCase(),
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.warning,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Colors.blueGrey[700],
                        Colors.blueGrey[500]
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
