import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/pages/home_page.dart';
import 'package:preferencias_user_app/src/pages/settings_page.dart';
import 'package:preferencias_user_app/src/share_prefs/preferencias_user.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  // vamos a esperar que se inicialice las preferencias.
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
      initialRoute: prefs.ultimaPag,
      routes: {
        HomePage.routeName    : ( BuildContext context) => HomePage(),
        SettingsPage.routeName: ( BuildContext context) => SettingsPage(),
      },
    );
  }
}