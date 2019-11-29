import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_citas_test/providers/db_provider.dart';


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

    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 22,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.blueGrey[700], Colors.blueGrey[500]],
              ),
            ),
          ),
          centerTitle: true,
          title: Text('Nueva Cita'.toUpperCase()),
        ),
        body: FutureBuilder(
            future: DBProvider.db.cargarDataAutocompletado(),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, List<dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return formulario(snapshot.data);
            }));
  }

  Widget formulario(dataAutocompletado) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            //decoration: BoxDecoration(),
            height: 40,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Cliente'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(50)),
          height: 60,
          width: double.infinity,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: AutoCompleteTextField(
                  controller: _clienteController,
                  clearOnSubmit: false,
                  suggestions: dataAutocompletado['clientes'],
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
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
                      _clienteController.text =
                          item.nombreCompleto;
              
                          idCliente=item.id;
                    });
                  },
                  itemBuilder: (context, item) {
                    // ui for the autocompelete row
                    return respAutocompletado(item);
                  },
                ),
                trailing: Icon(Icons.search),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Container(
            //decoration: BoxDecoration(),
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    height: 40,
                    width: 35,
                    child: Icon(
                      Icons.event_note,
                      size: 40,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Fecha'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          //decoration: BoxDecoration(),
          height: 60,
          width: double.infinity,
          color: Colors.grey[300],
          child: ListView(
            children: <Widget>[
              ListTile(
                title: TextField(
                  controller: _fechaController,
                  //enabled: false,
                  decoration: InputDecoration.collapsed(hintText: null),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  _seleccionarFecha(context);
                },
                trailing: Icon(Icons.search),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            //decoration: BoxDecoration(),
            height: 40,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    child: Icon(
                      Icons.recent_actors,
                      size: 40,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Especialista'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(50)),
          height: 60,
          width: double.infinity,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: searchTextField = AutoCompleteTextField(
                  controller: _especialistasController,
                  clearOnSubmit: false,
                  suggestions: dataAutocompletado['especialistas'],
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
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
                      _especialistasController.text =
                          item.nombreCompleto;

                          idEspecialista=item.id;
                    });
                  },
                  itemBuilder: (context, item) {
                    // ui for the autocompelete row
                    return respAutocompletado(item);
                  },
                ),
                trailing: Icon(Icons.search),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            //decoration: BoxDecoration(),
            height: 40,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    child: Icon(
                      Icons.view_list,
                      size: 40,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    'Servicios'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(50)),
          height: 60,
          width: double.infinity,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: searchTextField = AutoCompleteTextField(
                  controller: _servicioslistasController,
                  clearOnSubmit: false,
                  suggestions: dataAutocompletado['servicios'],
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    hintStyle: TextStyle(color: Colors.black),
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
                      _servicioslistasController.text =
                          item.nombre;

                          idServicio=item.id;
                    });
                  },
                  itemBuilder: (context, item) {
                    // ui for the autocompelete row
                    return respAutocompletado(item, true);
                  },
                ),
                trailing: Icon(Icons.search),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 210),
                  child: RaisedButton(
                    child: Text('GUARDAR'),
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
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                                    _clienteController.text='';
                                    _servicioslistasController.text='';
                                    _fechaController.text='';
                                    _especialistasController.text='';

                    },
                    hoverColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                // Container(
                //   child: RaisedButton(
                //     child: Text('CANCELAR'),
                //     onPressed: () {},
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //   ),
                // )
              ],
            ),
          )
        
      ],
    );
  }

  Widget respAutocompletado(datos, [servicios = false]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          servicios ? datos.nombre : datos.nombreCompleto,
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          servicios ? datos.descripcion : datos.direccion,
        ),
      ],
    );
  }

  void _seleccionarFecha(BuildContext context) async {
    DateTime picket = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025));
     final formato = DateFormat('dd-MM-yyyy');
    setState(() {
      _fechaController.text = picket!=null ?  formato.format(picket) : '';
    });
  }
}
