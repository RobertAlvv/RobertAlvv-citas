import 'package:flutter/material.dart';
import 'package:project_citas_test/Widgets/FloatButtonAnimated.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

class MyEspecialistas extends StatelessWidget {
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
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50.0, left: 8),
                    child: Text(
                      'Especialistas'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: Colors.blueGrey),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 16, right: 16),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        //enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          labelText: 'Nombre Completo',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        //enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          labelText: 'Correo Electronico',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        //enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          labelText: 'Direccion',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: TextField(
                        //enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          labelText: 'Telefono',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Text('Guardar',
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 20)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Cancelar',
                          style:
                              TextStyle(color: Colors.blueGrey, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  )
                ],
              ),
            ),
//        floatingActionButton: AnimatedFloatingActionButton(
//            //Fab list
//            fabButtons: <Widget>[float1(), float2()],
//            colorStartAnimation: Colors.blue,
//            colorEndAnimation: Colors.red,
//            animatedIconData: AnimatedIcons.menu_close //To principal button
//
//           ),
          ),
          Positioned(
            left: 330,
            top: 100,
            child: FloatingActionButton(
              backgroundColor: Colors.pink,
              child: new Icon(Icons.filter_list),
            ),
          )
        ],
      ),
    );
  }

  Widget float1() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'First button',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget float2() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Second button',
        child: Icon(Icons.add),
      ),
    );
  }
}