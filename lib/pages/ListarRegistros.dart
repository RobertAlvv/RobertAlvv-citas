//import 'package:flutter/material.dart';
//import 'ListarClientes.dart';
//import 'ListarEspecialista.dart';
//import 'ListarServicios.dart';
//
//class ListaRegistroPage extends StatefulWidget {
//  @override
//  _ListaRegistroState createState() => _ListaRegistroState();
//}
//
//class _ListaRegistroState extends State<ListaRegistroPage> {
//  int _pantallaConsultar = 1;
//  @override
//  Widget build(BuildContext context) {
//    return pantalla();
//  }
//
//  Widget pantalla() {
//    switch (_pantallaConsultar) {
//      case 1:
//        return ListarCliente();
//      case 2:
//        return ListarEspecialistaPage();
//      case 3:
//        return ListarServiciosPage();
//      default:
//        return Center(
//            child: Text(
//          "Error",
//          style: TextStyle(fontSize: 32.0, color: Colors.red),
//        ));
//    }
//  }
//
//}
