import 'package:flutter/material.dart';
import 'package:project_citas_test/Widgets/FloatButtonAnimated.dart';
import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';

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
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 8),
                      child: Text(
                        'Servicios'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Colors.blueGrey),
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
                        child: TextField(
                          //enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            labelText: 'Nombre Completo',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextField(
                          //enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            labelText: 'Correo Electronico',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextField(
                          //enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            labelText: 'Direccion',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: TextField(
                          //enabled: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            labelText: 'Telefono',
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
                          onPressed: () {},
                          child: Text('Guardar',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 20)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Cancelar',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    )
                  ],
                ),
              ),
//        floatingActionButton: AnimatedFloatingActionButton(
//            //Fab list
//            fabButtons: <Widget>[float1(), float2()],
//            colorStartAnimation: Colors.blue,
//            colorEndAnimation: Colors.red,
//            animatedIconData: AnimatedIcons.menu_close //To principal button
//            ),
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
                    onPressed: () {},
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
                    onPressed: () {},
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
