import 'package:animate_do_app/src/pages/01_page.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate_do',
      home: Pagina1Page()
    );
  }
}