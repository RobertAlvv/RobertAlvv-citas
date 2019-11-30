import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_citas_test/providers/db_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCita extends StatefulWidget {
  @override
  _AddCitaState createState() => _AddCitaState();
}

class _AddCitaState extends State<AddCita> {
  AutoCompleteTextField searchTextField;
  TextEditingController _clienteController = TextEditingController();
  TextEditingController _especialistasController = TextEditingController();
  TextEditingController _servicioslistasController = TextEditingController();
  TextEditingController _fechaController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int idCliente;
  int idEspecialista;
  int idServicio;

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
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 200),
            child: Container(
              height: 136,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 60),
                    child: Container(
                        height: 40,
                        width: 110,
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
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.chevronLeft,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              Text(
                                'Atras'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 135, top: 20),
                    child: Text(
                      'nueva cita'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 40,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w900,
                          color: Colors.teal.shade600),
                    ),
                  ),
                  Flexible(
                      child: FutureBuilder(
                          future: DBProvider.db.cargarDataAutocompletado(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Map<String, List<dynamic>>>
                                  snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return formulario(snapshot.data);
                          }))
                ],
              )),
        ));
  }

  Widget formulario(dataAutocompletado) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 22),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: AutoCompleteTextField(
              controller: _clienteController,
              textInputAction: TextInputAction.search,
              clearOnSubmit: false,
              suggestions: dataAutocompletado['clientes'],
              style: TextStyle(color: Colors.black87, fontSize: 16.0),
              decoration: InputDecoration(
                  labelText: 'Nombre del cliente',
                  focusColor: Colors.teal,
                  labelStyle: TextStyle(color: Colors.teal),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              itemFilter: (item, query) {
                return item.nombreCompleto
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.nombreCompleto.compareTo(b.nombreCompleto);
              },
              itemSubmitted: (item) {
                setState(() {
                  _clienteController.text = item.nombreCompleto;

                  idCliente = item.id;
                });
              },
              itemBuilder: (context, item) {
                // ui for the autocompelete row
                return respAutocompletado(item);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 22),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: TextFormField(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _seleccionarFecha(context);
              },
              controller: _fechaController,
              decoration: InputDecoration(
                focusColor: Colors.teal,
                labelStyle: TextStyle(color: Colors.teal),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: 'Fecha Agendada',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 22),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: searchTextField = AutoCompleteTextField(
              controller: _especialistasController,
              clearOnSubmit: false,
              suggestions: dataAutocompletado['especialistas'],
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                  focusColor: Colors.teal,
                  labelStyle: TextStyle(color: Colors.teal),
                  labelText: 'Nombre del especialista',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              itemFilter: (item, query) {
                return item.nombreCompleto
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.nombreCompleto.compareTo(b.nombreCompleto);
              },
              itemSubmitted: (item) {
                setState(() {
                  _especialistasController.text = item.nombreCompleto;

                  idEspecialista = item.id;
                });
              },
              itemBuilder: (context, item) {
                // ui for the autocompelete row
                return respAutocompletado(item);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 22),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: searchTextField = AutoCompleteTextField(
              controller: _servicioslistasController,
              clearOnSubmit: false,
              suggestions: dataAutocompletado['servicios'],
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                focusColor: Colors.teal,
                labelStyle: TextStyle(color: Colors.teal),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                labelText: 'Servicio a tratar',
              ),
              itemFilter: (item, query) {
                return item.nombre
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.nombre.compareTo(b.nombre);
              },
              itemSubmitted: (item) {
                setState(() {
                  _servicioslistasController.text = item.nombre;

                  idServicio = item.id;
                });
              },
              itemBuilder: (context, item) {
                // ui for the autocompelete row
                return respAutocompletado(item, true);
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
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
                    // DBProvider.db.registrarBD(CitasModel(fecha: DateTime.parse(_fechaController.text)
                    // ,id_cliente: idCliente,id_especialista: idEspecialista,id_servicio: idServicio)
                    // , 'citas');

                    final snackBar = SnackBar(
                      duration: Duration(milliseconds: 1200),
                      content: Text(
                          'La cita para el cliente ${_clienteController.text} se ha guardado'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    _scaffoldKey.currentState.showSnackBar(snackBar);
                    _clienteController.text = '';
                    _servicioslistasController.text = '';
                    _fechaController.text = '';
                    _especialistasController.text = '';
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Guardar'.toUpperCase(),
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
                        FontAwesomeIcons.save,
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
                  onPressed: () {},
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
    );
  }

  Widget respAutocompletado(datos, [servicios = false]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            servicios ? datos.nombre : datos.nombreCompleto,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.teal.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            servicios ? datos.descripcion : datos.direccion,
            style: TextStyle(
              color: Colors.blueGrey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  void _seleccionarFecha(BuildContext context) async {
    DateTime picket = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2021),
    );
    final formato = DateFormat('dd-MM-yyyy');
    setState(() {
      _fechaController.text = picket != null ? formato.format(picket) : '';
    });
  }
}
