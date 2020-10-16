import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {


  bool _darkTheme   = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch( theme ) {
      case 1 : //light
        _customTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
      break;
      
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
      break;
     
      case 3: //custom
        _customTheme = true;
        _darkTheme = false;
      break;

      default: 
        _customTheme = false;
        _darkTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    (value) ?  _currentTheme = ThemeData.dark() 
            :  _currentTheme = ThemeData.light();

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      // Usamos nuestro tema personalizado
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Colors.blue,
        primaryColorLight: Colors.white
      );
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }

}