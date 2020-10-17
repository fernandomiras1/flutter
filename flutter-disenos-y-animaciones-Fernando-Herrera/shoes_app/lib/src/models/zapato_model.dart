import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {

  String _assetImage = 'assets/imgs/azul.png';
  double _talla = 9.0;

  String get assetImage => this._assetImage;
  set assetImage( String value) {
    this._assetImage = value;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla( double value) {
    this._talla = value;
    notifyListeners();
  }
}