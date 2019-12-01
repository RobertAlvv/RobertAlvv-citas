import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:project_citas_test/models/citasModels.dart';
import 'package:project_citas_test/models/clienteModels.dart';
import 'package:project_citas_test/models/especialistaModels.dart';
import 'package:project_citas_test/models/serviciosModels.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._private();

  DBProvider._private();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDataBase();
    return _database;
  }

  initDataBase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    final String path = join(appDirectory.path, 'citas.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE clientes(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nombre_completo VARCHAR NOT NULL,correo VARCHAR,direccion VARCHAR NOT NULL,telefono VARCHAR NOT NULL)');

        await db.execute(
            'CREATE TABLE especialista(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nombre_completo VARCHAR NOT NULL,correo VARCHAR,direccion VARCHAR NOT NULL,telefono VARCHAR NOT NULL)');

        await db.execute(
            'CREATE TABLE servicios(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'nombre VARCHAR NOT NULL,descripcion NOT NULL)');

        await db.execute(
            'CREATE TABLE citas(id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'id_cliente INTEGER NOT NULL, fecha Date NOT NULL,id_especialista INTEGER NOT NULL,'
            'id_servicio INTEGER NOT NULL)');

        //           await db.execute(
        // 'CREATE TABLE detalles_citas(id INTEGER PRIMARY KEY AUTOINCREMENT,'
        //     'id_cita INTEGER NOT NULL,id_especialista INTEGER NOT NULL');
      },
    );
  }

  Future<int> registrarBD(dynamic registro, String tabla) async {
    final db = await database;

//    final userId = await db.rawInsert(
//        'INSERT INTO users (id,nombre) VALUES (${user.id},${user.nombre})');
//    final userId = await db.rawInsert(
//        'INSERT INTO users (id,nombre) VALUES (?,?)',[user.id,user.nombre]);
    final id = await db.insert('$tabla', registro.toMap());
    return id;
  }

  Future<List<ClienteModel>> listaCliente() async {
    final db = await database;

    final results = await db.query('clientes');

    List<ClienteModel> cli = results.isNotEmpty
        ? results.map((user) => ClienteModel.fromMap(user)).toList()
        : [];
    return cli;
  }

  Future<List<EspecialistaModel>> listaEspecialista() async {
    final db = await database;

    final results = await db.query('especialista');

    List<EspecialistaModel> especialista = results.isNotEmpty
        ? results.map((user) => EspecialistaModel.fromMap(user)).toList()
        : [];
    return especialista;
  }

  Future<List<ServicioModel>> listaServicio() async {
    final db = await database;

    final results = await db.query('servicios');

    List<ServicioModel> servicio = results.isNotEmpty
        ? results.map((user) => ServicioModel.fromMap(user)).toList()
        : [];
    return servicio;
  }
  // Future<UserModel> searchUserById(int id) async {
  //   final db = await database;

  //   final result = await db.query('users', where: 'id = ?',
  //       whereArgs: [id]);
  //   //final result = await db.execute('SELECT * FROM users WHERE id = $id');

  //   return result.isNotEmpty ? UserModel.fromMap(result.first) : null;
  // }

  Future<int> updateBD(dynamic registro, String tabla) async {
    final db = await database;
     print(registro.toMap());
    final result = await db.update('$tabla', registro.toMap(),
        where: 'id = ?', whereArgs: [registro.id]);
    return result;
  }

  Future<int> deleteById(int id, String tabla) async {
    final db = await database;

    final result = await db.delete('$tabla', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> delete(String tabla) async {
    final db = await database;

    final result = await db.delete('$tabla');
    return result;
  }

  Future <Map<String,List<dynamic>>> cargarDataAutocompletado() async {
    final clientes      =     await listaCliente();
    final especialistas =    await listaEspecialista();
    final servicios     =     await listaServicio();
    Map<String,List<dynamic>> dataAutocompletado = {
       'clientes':clientes,
       'especialistas':especialistas,
       'servicios':servicios
    };

    return dataAutocompletado;
  }

  

  Future <List<CitasModel>> mostrarCitas() async {
        final db = await database;
        final results = await db.rawQuery('SELECT citas.fecha as fecha_cita,clientes.nombre_completo as nombre_cliente,servicios.nombre as nombre_servicio from citas INNER JOIN clientes on clientes.id = citas.id_cliente INNER JOIN servicios on servicios.id=citas.id_servicio');
     
        List<CitasModel> citas = results.isNotEmpty
        ? results.map((cita) => CitasModel.fromMapCitas(cita)).toList()
        : [];
   
      
    return citas;
  }
}
