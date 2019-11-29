import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_citas_test/models/clienteModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';

class ListarCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _consultarClientes();
  }

  Widget _consultarClientes() {
    return FutureBuilder<List<ClienteModel>>(
      future: DBProvider.db.listaCliente(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ClienteModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data.length == 0) {
          return Center(
            child: Text(
              'No hay clientes registrados',
              style: TextStyle(fontSize: 28.0, color: Colors.red),
            ),
          );
        }
        return ListView(
          children: _listaMapCliente(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _listaMapCliente(
      BuildContext context, List<ClienteModel> clientes) {
    List<Widget> list = new List<Widget>();
    clientes.forEach((cliente) {
      list
        ..add(Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.redAccent,
            ),
            onDismissed: (direction) {
              DBProvider.db.deleteById(cliente.id, 'clientes');
            },
            child: Card(
              margin: EdgeInsets.only(top: 20),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 100),
                      Flexible(
                        child: ListTile(
                          leading: Icon(Icons.perm_identity),
                          title: Text('${cliente.nombreCompleto}',
                              style: TextStyle(fontSize: 18)),
                          subtitle: Text('Ubicación en  ${cliente.direccion}',
                              style: TextStyle(fontSize: 15)),
                          onTap: () {},
                        ),
                      ),
                      FlatButton(
                          child: Icon(Icons.edit, color: Colors.blue, size: 25),
                          onPressed: () {
                            // ListUserPage.seleccionarPantalla = 2;
                            // usuarioEditar = user;
                            // setState(() {

                            // });
                          })
                    ],
                  ),
                  SizedBox(height: 10)
                ],
              ),
            )))
        ..add(SizedBox(height: 20));
    });
    return list;
  }
}
