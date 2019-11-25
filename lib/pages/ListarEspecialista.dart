import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_citas_test/models/especialistaModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';

class ListarEspecialistaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _consultarEspecialista();
  }

  Widget _consultarEspecialista() {
    return FutureBuilder<List<EspecialistaModel>>(
      future: DBProvider.db.listaEspecialista(),
      builder: (BuildContext context,
          AsyncSnapshot<List<EspecialistaModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data.length == 0) {
          return Center(
            child: Text(
              'No hay especialista registrados',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
          );
        }
        return ListView(
          children: _listaMapEspecialista(context, snapshot.data),
        );
      },
    );
  }


  List<Widget> _listaMapEspecialista(
      BuildContext context, List<EspecialistaModel> especialista) {
    return especialista.map((especialita) {
      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent,
        ),
        onDismissed: (direction) {
          DBProvider.db.deleteById(especialita.id, 'especialista');
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.perm_identity),
                title: Text('${especialita.nombreCompleto}'),
                subtitle: Text('Vive en  ${especialita.direccion}'),
                onTap: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      child: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        // ListUserPage.seleccionarPantalla = 2;
                        // usuarioEditar = user;
                        // setState(() {

                        // });
                      }),
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
