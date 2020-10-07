import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/bloc/scans_bloc.dart';
import 'package:qr_scanner_app/src/models/scan_model.dart';
// pages
import 'package:qr_scanner_app/src/pages/direcciones_page.dart';
import 'package:qr_scanner_app/src/pages/mapas_page.dart';
// plugin del Scanner
import 'package:barcode_scan/barcode_scan.dart';
import 'package:qr_scanner_app/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('QR Scanner'),
        actions: [
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: scansBloc.borrarScansTODOS)
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigationBar(),
      // posicionamos el btn en el centro.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(BuildContext context) async {
    // String futureString = 'https://www.google.com';

    // geo:40.68363102224314,-73.94276991328128

    ScanResult result = await BarcodeScanner.scan();

    print(result.rawContent); // The barcode content este tiene el string

    if (result.rawContent != null) {
      final scan = ScanModel(valor: result.rawContent);
      // llamamos a la base para insercion
      scansBloc.agregarScan(scan);

      final scan2 = ScanModel(valor: 'geo:40.68363102224314,-73.94276991328128');
      scansBloc.agregarScan(scan2);

      // determinamos si es IOS
      if (Platform.isIOS) {
        // demodarmos 750 milisegunas
				// es el tiempo q tarda en cerrar la camara. para luego abrir la url
        Future.delayed(Duration(milliseconds: 750), () {
          utils.abrirScan(context, scan);
        });
      } else {
      utils.abrirScan(context, scan);
			}

    }
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        // le va a decir que elemnto esta activo
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Mapa', icon: Icon(Icons.map)),
          BottomNavigationBarItem(
              label: 'Direcciones', icon: Icon(Icons.brightness_5))
        ]);
  }
}
