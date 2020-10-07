import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
export 'package:qr_scanner_app/src/models/scan_model.dart';

// Creamos una base de datos en sqllite. ( en el telefono fisico)

class DBProvider {
  // Patron sigleton: para q solo tengamos una instancia de la base de datos corriendo aca.
  static Database _database;
  // generamos un contructor privado.
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // si hay info q devuela esa instancia.
    if (_database != null) return _database;
    // creamos una nueva intancia
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // donde se encuentra el archivo de base de datos.
    final path = join(documentsDirectory.path, 'ScansDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      // creamos la primera tabla
      await db.execute(
					'CREATE TABLE Scans ('
          '	id INTEGER PRIMARY KEY,'
          ' tipo TEXT,'
          ' valor TEXT'
          ')');
    });
  }

  // Crear registros - FORMA 01
  nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;

    final sql = "INSERT Into Scans (id, tipo, valor) "
        "VALUES ( ${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')";

    final res = await db.rawInsert(sql);
    return res;
  }

  // Crear registros - FORMA 02 ( esta vamos a usar)
  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  // SELECT - Obtener Informacion
  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    // si no esta vacio, que regrese el primer elemento del listado
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  // todos los Scans de la tabla Scans de la base de datos.
  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  // Actualizar Registro
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    // id = ? ( eso quiere decir id con argumentos)
    // vamos a hacer el update al id que sea igual al id que le estoy pasadno por agumento.
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  // Eliminar registros por ID
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  // Eliminar todo
  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.delete('Scans');
    // esta es otra forma de eliminar con el raw
    //  final res = await db.rawQuery("DELETE FROM Scans");
    return res;
  }
}
