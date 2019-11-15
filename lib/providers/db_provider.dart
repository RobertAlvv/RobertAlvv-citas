import 'dart:io';

import 'package:path_provider/path_provider.dart';
// import 'package:saturday_drawer_app/models/userModel.dart';
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
    Directory appDirectory = await
    getApplicationDocumentsDirectory();
    final String path = join(appDirectory.path, 'citas.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        //https://old.sqliteonline.com/
        await db.execute(
            'CREATE TABLE clientes(id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'nombre_completo VARCHAR NOT NULL,sexo CHART NOT NULL,direccion VARCHAR NOT NULL,telefono VARCHAR NOT NULL)');

                  await db.execute(
            'CREATE TABLE especialista(id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'nombre_completo VARCHAR NOT NULL,sexo CHART NOT NULL,direccion VARCHAR NOT NULL,telefono VARCHAR NOT NULL)');

                    await db.execute(
            'CREATE TABLE servicios(id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'nombre VARCHAR NOT NULL,descripcion NOT NULL)');


                   await db.execute(
            'CREATE TABLE citas(id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'id_cliente INTEGER NOT NULL, fecha Date NOT NULL');

                      await db.execute(
            'CREATE TABLE detalles_citas(id INTEGER PRIMARY KEY AUTOINCREMENT,'
                'id_cita INTEGER NOT NULL,id_especialista INTEGER NOT NULL');
        },

        

      
    );
  }

}
