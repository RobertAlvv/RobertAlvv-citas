import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_citas_test/models/serviciosModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';

class ListarServiciosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _consultarServicios();
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



  List<Widget> _listaMapServicios( BuildContext context, List<ServicioModel> servicios) {
    return servicios.map((servicio) {
      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent,
        ),
        onDismissed: (direction) {
          DBProvider.db.deleteById(servicio.id, 'servicios');
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.perm_identity),
                title: Text('${servicio.nombre}'),
                subtitle: Text('Descripción ${servicio.descripcion}'),
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      child: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {}),
                  FlatButton(
                      child: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        //Navigator.pushNamed(context, 'user_details');
                      })
                ],
              )
            ],
          ),
        ),
      );
    }).toList();
  }

}
