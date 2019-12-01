import 'package:flutter/material.dart';
import 'package:project_citas_test/pages/ListarEspecialista.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'AddEspecialista.dart';

final scaffoldKeyEspecialista = GlobalKey<ScaffoldState>();
bool isOpenedEspecialista = false;
int EspecialistaseleccionarPantalla;

class MyEspecialistas extends StatefulWidget {
  @override
  _MyEspecialistasState createState() => _MyEspecialistasState();
}

class _MyEspecialistasState extends State<MyEspecialistas>
    with SingleTickerProviderStateMixin {
  double _opacity = 1.0;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    EspecialistaseleccionarPantalla = 1;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.teal.shade600,
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
    if (!isOpenedEspecialista) {
      _animationController.forward();
      _opacity = 0.4;
    } else {
      _animationController.reverse().whenComplete(() {
        _opacity = 1.0;
      });
    }
    isOpenedEspecialista = !isOpenedEspecialista;
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
              key: scaffoldKeyEspecialista,
              backgroundColor: Colors.transparent,
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
                        padding: EdgeInsets.only(right: 40, top: 40),
                        child: Text(
                          'Especialistas'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 45,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w900,
                              color: Colors.teal.shade600),
                        ),
                      ),
                      Flexible(
                          child: seleccionarPantalla(
                              EspecialistaseleccionarPantalla))
                    ],
                  )),
            ),
          ),
          Positioned(
            left: 225,
            top: 110,
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
                    backgroundColor: Colors.teal.shade600,
                    onPressed: () {
                      setState(() {
                        EspecialistaseleccionarPantalla = 1;
                        animate();
                      });
                    },
                    tooltip: 'Buscar',
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
                    backgroundColor: Colors.teal.shade600,
                    onPressed: () {
                      setState(() {
                        EspecialistaseleccionarPantalla = 2;
                        animate();
                      });
                    },
                    tooltip: 'Agregar',
                    child: Icon(Icons.add),
                    heroTag: "add",
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: _buttonColor.value,
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

  Widget seleccionarPantalla(int v) {
    switch (v) {
      case 1:
        return ListarEspecialistaPage();
      case 2:
        return formularioEspecialista('','','','');
    }
  }
}
