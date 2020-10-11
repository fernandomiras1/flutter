import 'package:flutter/material.dart';
import 'package:form_validation_login_app/src/bloc/provider.dart';
import 'package:form_validation_login_app/src/pages/home_page.dart';
import 'package:form_validation_login_app/src/pages/login_page.dart';
import 'package:form_validation_login_app/src/pages/producto_page.dart';
import 'package:form_validation_login_app/src/pages/registro_page.dart';
import 'package:form_validation_login_app/src/prefs_user/preferencias_user.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: goHome(prefs.token),
        routes: {
          'login'     : (BuildContext context) => LoginPage(),
          'registro'  : (BuildContext context) => RegistroPage(),
          'home'      : (BuildContext context) => HomePage(),
          'producto'  : (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      )
    );
    
  }

  String goHome(String token) {
    return token.isNotEmpty ? 'home' : 'login';
  }
}