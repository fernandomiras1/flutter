import 'package:estados_singleton_app/pages/pag1_page.dart';
import 'package:estados_singleton_app/pages/pag2_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => Page1Page(),
        'pagina2': (_) => Page2Page(),
      },
    );
  }
}