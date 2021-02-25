import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
export 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //Path de donde vamos a tener la base de datos
    Directory documentosDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentosDirectory.path, 'ScansDB.db');
    print(path);

    //Crear DB
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''

      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY,
        tipo TEXT,
        valor TEXT
      )
      
      ''');
    });
  }

  Future<int> nuevoSacanRaw(ScanModel nuevoSacan) async {
    final id = nuevoSacan.id;
    final tipo = nuevoSacan.tipo;
    final valor = nuevoSacan.valor;
    //verificar la base de datos
    final db = await database;
    final res = await db.rawInsert('''

    INSERT INTO Scans( id, tipo, valor ) VALUES ( $id, '$tipo', '$valor')
    
    
    
    ''');

    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }
}
