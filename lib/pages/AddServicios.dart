import 'package:flutter/material.dart';
import 'package:project_citas_test/models/serviciosModels.dart';
import 'package:project_citas_test/providers/db_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ServiciosPages.dart';

class formularioServicio extends StatelessWidget {
  TextEditingController _nombreController;
  TextEditingController _descripcionController;
  final _formKey = GlobalKey<FormState>();

  String nombre;
  String descripcion;
  int id;

  formularioServicio(this.nombre, this.descripcion,this.id);
  String valorIcono = "editar";
  final _icons = <String, IconData>{
    "editar": FontAwesomeIcons.edit,
    "salvar": FontAwesomeIcons.save,
  };

  @override
  Widget build(BuildContext context) {
    _descripcionController = TextEditingController(text: descripcion);
    _nombreController = TextEditingController(text: nombre);
    if (_nombreController.text != "" && _descripcionController.text != "") {
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
                controller: _nombreController,
                enabled: !isOpenedServices,
                validator: (valor) {
                  return valor.isEmpty ? 'El nombre es requerido' : null;
                },
                //enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Nombre',
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
                controller: _descripcionController,
                enabled: !isOpenedServices,
                validator: (valor) {
                  return valor.isEmpty ? 'La descripción es requerida' : null;
                },
                //enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Descripción',
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
                            ServicioModel(
                                nombre: _nombreController.text,
                                descripcion: _descripcionController.text),
                            'servicios');
                        _formKey.currentState?.reset();
                        }else{
                            accion ='actualizado';
                            DBProvider.db.updateBD(
                            ServicioModel(
                                id: id,
                                nombre: _nombreController.text,
                                descripcion: _descripcionController.text),
                            'servicios');
                        }
                      
                        final snackBar = SnackBar(
                          duration: Duration(milliseconds: 1200),
                          content: Text(
                              'El servicio ${_nombreController.text} se ha $accion'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        scaffoldKeyServices.currentState.showSnackBar(snackBar);
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
          ),
        ],
      ),
    );
  }
}
