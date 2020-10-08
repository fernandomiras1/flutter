import 'package:flutter/material.dart';
import 'package:preferencias_user_app/src/share_prefs/preferencias_user.dart';
import 'package:preferencias_user_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    // guardamos la pagina acutal en el storage
    prefs.ultimaPag = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      // Menu lateral.
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color Secundario: ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombreUser}'),
          Divider(),
        ],
      ),
    );
  }

}