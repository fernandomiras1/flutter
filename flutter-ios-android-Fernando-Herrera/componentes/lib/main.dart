import 'package:flutter/material.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'package:componentes/src/pages/home_temp.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Español
      ],
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // home: HomePage());
      // Definimos las rutas que va a tener la app
      initialRoute: '/',
      routes: getApplicationRoutes(),
      // Cuando no tengamos una ruta que no existe. Cuando la ruta no esta registrada en las routas, se dipara el onGenerateRoute
      onGenerateRoute: (settings) {
        // Aca podemos devolver una pagina en particular.
        print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
