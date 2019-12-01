import 'package:flutter/material.dart';
import 'package:project_citas_test/models/clienteModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ClientesPage.dart';

class formularioCliente extends StatelessWidget {
  TextEditingController _nombreController;
  TextEditingController _correoController;
  TextEditingController _direccionController;
  TextEditingController _telefonoController;

  final _formKey = GlobalKey<FormState>();

  String nombre;
  String correo;
  String direccion;
  String telefono;
  int id;

  String valorIcono = "editar";
  final _icons = <String, IconData>{
    "editar": FontAwesomeIcons.edit,
    "salvar": FontAwesomeIcons.save,
  };

  formularioCliente(this.nombre, this.correo, this.direccion, this.telefono,this.id);

  @override
  Widget build(BuildContext context) {
    _nombreController = TextEditingController(text: nombre);
    _correoController = TextEditingController(text: correo);
    _direccionController = TextEditingController(text: direccion);
    _telefonoController = TextEditingController(text: telefono);

    if (_nombreController.text != "" &&
        _correoController.text != "" &&
        _telefonoController.text != "" &&
        _direccionController.text != "") {
      valorIcono = "editar";
    } else {
      valorIcono = "salvar";
    }
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 35, left: 10, right: 22),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                enabled: !isOpenedCliente,
                controller: _nombreController,
                validator: (valor) {
                  return valor.isEmpty ? 'El nombre es requerido' : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Nombre Completo',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 22),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                enabled: !isOpenedCliente,
                controller: _correoController,
                validator: (valor) {
                  return valor.isEmpty ? 'El correo es requerido' : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Correo Electrónico',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 22),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                enabled: !isOpenedCliente,
                controller: _direccionController,
                validator: (valor) {
                  return valor.isEmpty ? 'Este campo es requerido' : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Cedula o RNC',
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 22),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                keyboardType: TextInputType.number,
                enabled: !isOpenedCliente,
                controller: _telefonoController,
                validator: (valor) {
                  return valor.isEmpty ? 'El teléfono es requerido' : null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Teléfono',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.teal.shade600,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(1, 8),
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 1,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                         String accion ='guardado';
                        if(valorIcono=='salvar'){
                                DBProvider.db.registrarBD(
                            ClienteModel(
                                nombreCompleto: _nombreController.text,
                                direccion: _direccionController.text,
                                correo: _correoController.text,
                                telefono: _telefonoController.text),
                            'clientes');
                        _formKey.currentState?.reset();
                        }else{
                          accion ='actualizado';
                               DBProvider.db.updateBD(
                            ClienteModel(
                              id: id,
                                nombreCompleto: _nombreController.text,
                                direccion: _direccionController.text,
                                correo: _correoController.text,
                                telefono: _telefonoController.text),
                            'clientes');
                        }
                  
                        final snackBar = SnackBar(
                          duration: Duration(milliseconds: 1200),
                          content: Text(
                              'El cliente ${_nombreController.text} se ha $accion'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        scaffoldKeyCliente.currentState.showSnackBar(snackBar);
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          valorIcono.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          _icons[valorIcono],
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: 15,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.teal.shade600,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(1, 8),
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 0.9,
                    onPressed: () {
                      _formKey.currentState?.reset();
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Cancelar'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Icon(
                          FontAwesomeIcons.times,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: 25,
              )
            ],
          )
        ],
      ),
    );
  }
}
