import 'package:estados_singleton_app/pages/pag1_page.dart';
import 'package:estados_singleton_app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados_singleton_app/pages/pag2_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // lazy: true: es por defecto: Si no la necesita a la instancia no la impremeta
        // lazy; false; apenas se crea este widget crea la instancia
        ChangeNotifierProvider(create: (_) => new UsuarioService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Page1Page(),
          'pagina2': (_) => Page2Page(),
        },
      ),
    );
  }
}