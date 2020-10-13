import 'package:flutter/material.dart';
import 'package:ui_pro_app/src/pages/scroll_header.dart';
// import 'package:ui_pro_app/src/pages/animaciones_page.dart';
// import 'package:ui_pro_app/src/pages/graficas_circulares_page.dart';

// import 'package:ui_pro_app/src/pages/headers_page.dart';
// import 'package:ui_pro_app/src/labs/slideshow_page.dart';
import 'package:ui_pro_app/src/pages/slides_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: ScrollHeaderPage(),
    );
  }
}