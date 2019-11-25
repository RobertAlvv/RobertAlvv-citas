import 'package:flutter/material.dart';
import 'package:project_citas_test/models/serviciosModels.dart';
import 'package:project_citas_test/pages/ListarServicios.dart';
import 'package:project_citas_test/providers/db_provider.dart';

class MyServicios extends StatefulWidget {
  @override
  _MyServiciosState createState() => _MyServiciosState();
}

class _MyServiciosState extends State<MyServicios>
    with SingleTickerProviderStateMixin {
  double _opacity = 1.0;
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
   int _seleccionarPantalla=1;

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _descripcionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.indigo.withOpacity(0.9),
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
      _opacity = 0.4;
    } else {
      _animationController.reverse().whenComplete(() {
        _opacity = 1.0;
      });
    }
    isOpened = !isOpened;
  }

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
          Opacity(
            opacity: _opacity,
            child: Scaffold(
              key: _scaffoldKey,
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
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 55.0, right: 200),
                        child: Text(
                          'Servicios'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Colors.blueGrey),
                        ),
                      ),
                      Flexible(child: seleccionarPantalla())
                  ]
                  
                )
              ),
            ),
          ),
          Positioned(
            left: 220,
            top: 98,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                    _translateButton.value * 2.0,
                    0.0,
                    0.0,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo.withOpacity(0.9),
                    onPressed: () {
                      setState(() {
                        _seleccionarPantalla=2;
                      });
                    },
                    tooltip: 'Inbox',
                    child: Icon(Icons.search),
                    heroTag: "search",
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                    _translateButton.value * 1.0,
                    0.0,
                    0.0,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo.withOpacity(0.9),
                    onPressed: () {
                       setState(() {
                        _seleccionarPantalla=1;
                      });
                    },
                    tooltip: 'Inbox',
                    child: Icon(Icons.add),
                    heroTag: "add",
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: _buttonColor.value,
                  elevation: 25,
                  onPressed: () {
                    setState(() {
                      animate();
                      _opacity;
                    });
                  },
                  tooltip: 'Toggle',
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _animateIcon,
                  ),
                  heroTag: "menu",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

 

Widget formulario(){
        return Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 35, left: 16, right: 16),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            controller: _nombreController,
                            validator: (valor) {
                              return valor.isEmpty
                                  ? 'El nombre es requerido'
                                  : null;
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
                        padding:
                            const EdgeInsets.only(top: 35, left: 16, right: 16),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: TextFormField(
                            controller: _descripcionController,
                            validator: (valor) {
                              return valor.isEmpty
                                  ? 'La descripción es requerida'
                                  : null;
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                DBProvider.db.registrarBD(
                                    ServicioModel(
                                        nombre: _nombreController.text,
                                        descripcion:
                                            _descripcionController.text),
                                    'servicios');
                                final snackBar = SnackBar(
                                  duration: Duration(milliseconds: 1200),
                                  content: Text(
                                      'El servicio ${_nombreController.text} se ha guardado'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      // Some code to undo the change.
                                    },
                                  ),
                                );
                                _scaffoldKey.currentState
                                    .showSnackBar(snackBar);
                                _formKey.currentState?.reset();
                              }
                            },
                            child: Text('Guardar',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 20)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          FlatButton(
                            onPressed: () {
                                _formKey.currentState?.reset();
                            },
                            child: Text(
                              'Cancelar',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      )
                    ],
                  ),
                );
}

 Widget seleccionarPantalla(){
    switch (_seleccionarPantalla){
    case 1 : return formulario();
    case 2 : return ListarServiciosPage();
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

    }
