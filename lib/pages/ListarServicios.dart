import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_citas_test/models/serviciosModels.dart';
import 'package:project_citas_test/pages/AddServicios.dart';
import 'package:project_citas_test/providers/db_provider.dart';
import 'ServiciosPages.dart';
import 'AddServicios.dart';

class ListarServiciosPage extends StatefulWidget {
  @override
  _ListarServiciosPageState createState() => _ListarServiciosPageState();
}

class _ListarServiciosPageState extends State<ListarServiciosPage> {
  String _nombre = "";
  String _descripcion = "";
  int _id;

  @override
  Widget build(BuildContext context) {
    return seleccionarPantalla(ServicioseleccionarPantalla);
  }

  Widget _consultarServicios() {
    return FutureBuilder<List<ServicioModel>>(
      future: DBProvider.db.listaServicio(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ServicioModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data.length == 0) {
          return Center(
            child: Text(
              'No hay servicios registrados',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
          );
        }
        return ListView(
          children: _listaMapServicios(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaMapServicios(
      BuildContext context, List<ServicioModel> servicios) {
    return servicios.map((servicio) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
        child: Dismissible(
          // ignore: missing_return
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              final bool res = await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Icon(
                        Icons.warning,
                        color: Colors.red,
                        size: 60,
                      ),
                      elevation: 8,
                      content:
                          Text("Seguro que quieres eliminar este servicio?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            "Eliminar",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            // TODO: Delete the item from DB etc..
                            setState(() {
                              DBProvider.db
                                  .deleteById(servicio.id, 'servicios');
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              return res;
            } else {
              setState(() {
                ServicioseleccionarPantalla = 2;
                seleccionarPantalla(ServicioseleccionarPantalla);
                _nombre = servicio.nombre;
                _descripcion = servicio.descripcion;
                _id = servicio.id;
              });
            }
          },
          key: UniqueKey(),
          background: slideRightBackground(),
          secondaryBackground: slideLeftBackground(),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 85),
                    Flexible(
                      child: ListTile(
                        leading: Icon(
                          Icons.view_list,
                          size: 32,
                          color: Colors.teal.shade700,
                        ),
                        title: Text('${servicio.nombre}'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w800,
                                color: Colors.blueGrey.shade800)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text('Descripción en  ${servicio.descripcion}',
                              style: TextStyle(fontSize: 14)),
                        ),
                        //onTap: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.teal.shade700,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Editar".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Eliminar".toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  Widget seleccionarPantalla(int v) {
    switch (v) {
      case 1:
        return _consultarServicios();
      case 2:
        return formularioServicio(_nombre, _descripcion,_id);
    }
  }
}
