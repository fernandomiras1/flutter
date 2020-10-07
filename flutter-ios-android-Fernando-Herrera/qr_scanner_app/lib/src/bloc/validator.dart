import 'dart:async';
import 'package:qr_scanner_app/src/models/scan_model.dart';

class Validators {

  // vamos a crear nuestro primer streamTrasformer, serian como los pipe en rxjs
  final validarGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    // vamos a recibir nuestra lista de scans
    handleData: (scans, sink) {
      final geoScans = scans.where((s) => s.tipo == 'geo').toList();
      sink.add(geoScans);
    }
  );

  final validarHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers(
    handleData: (scans, sink) {
      final geoScans = scans.where((s) => s.tipo == 'http').toList();
      sink.add(geoScans);
    }
  );
}