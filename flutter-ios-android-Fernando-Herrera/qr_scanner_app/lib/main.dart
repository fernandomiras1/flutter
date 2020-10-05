import 'package:flutter/material.dart';
import 'package:qr_scanner_app/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'QRReader',
			initialRoute: 'home',
			routes: {
				'home': (BuildContext context) => HomePage(),
			},
			// cambiamos los estilos globales de mi aplicacion.
			theme: ThemeData(
				primaryColor: Colors.deepPurple
			),
		);
	}
}