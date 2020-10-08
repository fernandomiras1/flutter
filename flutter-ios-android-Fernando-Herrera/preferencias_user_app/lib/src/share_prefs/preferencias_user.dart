import 'package:preferencias_user_app/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  // Patron Singleton una sola instancia
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();


  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
  // Ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // --- GET y SET del Genero
  get genero {
    // si no existe genero que traiga un 1 por default
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  // --- GET y SET del color Secundario
  get colorSecundario {
    // si no existe colorSecundario que traiga un false por default
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  // --- GET y SET del nombreUsuario
  get nombreUser {
    // si no existe nombreUser que traiga un '' por default
    return _prefs.getString('nombreUser') ?? '';
  }

  set nombreUser(String value) {
    _prefs.setString('nombreUser', value);
  }

  // --- GET y SET del ultima pagina
  get ultimaPag {
    // si no existe ultimaPag que traiga un home por default
    return _prefs.getString('ultimaPag') ?? HomePage.routeName;
  }

  set ultimaPag(String value) {
    _prefs.setString('ultimaPag', value);
  }

}