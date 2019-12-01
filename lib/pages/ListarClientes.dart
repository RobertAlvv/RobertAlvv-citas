import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_citas_test/models/clienteModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';
import 'AddCliente.dart';
import 'ClientesPage.dart';

class ListarCliente extends StatefulWidget {
  @override
  _ListarClienteState createState() => _ListarClienteState();
}

class _ListarClienteState extends State<ListarCliente> {
  String _nombre = "";
  String _correo = "";
  String _direccion = "";
  String _telefono = "";
  int  _id;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return seleccionarPantalla(ClienteseleccionarPantalla);
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
    return clientes.map((cliente) {
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
                          Text("Seguro que quieres eliminar este cliente?"),
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
                              DBProvider.db.deleteById(cliente.id, 'clientes');
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
                ClienteseleccionarPantalla = 2;
                seleccionarPantalla(ClienteseleccionarPantalla);
                _nombre = cliente.nombreCompleto;
                _correo = cliente.correo;
                _telefono = cliente.telefono;
                _direccion = cliente.direccion;
                _id = cliente.id;
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
                        title: Text('${cliente.nombreCompleto}'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 22,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w800,
                                color: Colors.blueGrey.shade800)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text('Ubicación en  ${cliente.direccion}',
                              style: TextStyle(fontSize: 14)),
                        ),
                        onTap: () {},
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
        return _consultarClientes();
      case 2:
        return formularioCliente(_nombre, _correo, _direccion, _telefono,_id);
    }
  }
}
