import 'dart:async';

import 'package:qr_scanner_app/src/bloc/validator.dart';
import 'package:qr_scanner_app/src/providers/db_provider.dart';

class ScansBloc with Validators {
  // patros sigletos para crear una sola instancia de mi patron Bloc
  static final ScansBloc _singleton = new ScansBloc._internal();

  // basiacamente cuando se llame a esta Instancia ScansBloc va a devoler una unica instnacias de la misma.
  // eje: final scanBloc = new ScansBloc
  factory ScansBloc() {
    return _singleton;
  }
  // creamos el construcotr Privado
  ScansBloc._internal() {
    // Obtener Scans de la Base de datos
    obtenerScans();
  }

  // Crear el Flujo de datos.
  final _scansController = StreamController<List<ScanModel>>.broadcast();

  // Escuchar la informacion que fluje atraves del mimso. pero de GEO
  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validarGeo);
  // Va a estar ecuchando cuando sean solo de tipo http
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp);

  dispose() {
    // rompere la subscipcion.
    _scansController?.close();
  }

  obtenerScans() async {
    // Agregamos todos los scans al flujo de datos.
    _scansController.sink.add(await DBProvider.db.getAllScans());
  }

	agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }


  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    // actualizamos el flujo de informacion nuevamente.
    obtenerScans();
  }

  borrarScansTODOS() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}
