import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(BuildContext context, ScanModel scan) async {
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
      // abirmos la url en un navegador
      await launch(scan.valor);
    } else {
      throw 'Could not launch ${scan.valor}';
    }
  } else {
    // Navemamos a la pagina del mapa
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
