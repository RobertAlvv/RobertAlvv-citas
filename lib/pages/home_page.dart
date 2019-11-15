import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:project_citas_test/pages/navegationBar.dart';

import 'create_userTempory.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _menuForm = [
    {'label': 'Crear Usuario', 'icon': Icons.person_add, 'ruta': 0},
    {
      'label': 'navegation Text',
      'icon': Icons.perm_contact_calendar,
      'ruta': 1
    },
    {'label': 'Lista de Usuario', 'icon': Icons.list, 'ruta': 2},
    {'label': 'Actualizar Usuario', 'icon': Icons.update, 'ruta': 3},
    {'label': 'Eliminar Usuario', 'icon': Icons.delete, 'ruta': 4},
  ];

  final _menuCitas = [
    {'label': 'Lista de Citas', 'ruta': 5}
  ];

  int _selectpage = 0;

  String _app = 'Crear Usuario';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_app),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _getselectpage(),
      drawer: Drawer(
        child: _drawerElement(context),
      ),
    );
  }

  Widget _drawerElement(BuildContext context) {
    List<Widget> listaWidgetDrawer = List<Widget>();
    listaWidgetDrawer.add(_drawerHeader());
    for (Map it in _menuForm) {
      listaWidgetDrawer.add(itemMenu(it, context));
    }
    return ListView(
      children: listaWidgetDrawer,
    );
  }

  Widget _drawerHeader() {
    return DrawerHeader(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Icon(
              Icons.person,
              size: 60.0,
            ),
            backgroundColor: Colors.grey,
            radius: 45,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 13, 0),
                child: Text(
                  'USUARIO 1',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white70),
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('usuario@usuario.com'),
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Colors.deepOrangeAccent,
          Colors.red,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.3, 0.8],
      )),
    );
  }

  Widget itemMenu(Map it, BuildContext context) {
    return ListTile(
      title: Text(
        it['label'],
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey.shade700,
          wordSpacing: 2.0,
          letterSpacing: 0.2,
        ),
      ),
      leading: Icon(it['icon']),
      onTap: () {
        setState(() {
          print('entro');
          _selectpage = it['ruta'];
          Navigator.pop(context);
          _app = it['label'];
        });
      },
    );
  }

  Widget _getselectpage() {
    switch (_selectpage) {
      case 0:
//        return CreateUserPage();
//
      default:
        return Center(
          child: Text(
            "Not Found 404",
            style: TextStyle(fontSize: 32.0, color: Colors.red),
          ),
        );
    }
  }
}
