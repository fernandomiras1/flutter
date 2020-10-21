import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados_singleton_app/models/usuario.dart';
import 'package:estados_singleton_app/services/user_service.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario 
          ? Text('Nombre: ${usuarioService.usuario.nombre}')
          : Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                // como estamos dentro de un metodo tiene que estar el listen: false. Para que no se redibueje.
                // final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                final newUser = new Usuario(
                  nombre: 'Fernando Miras',
                  edad: 28,
                  profesiones: ['Develop', 'FrontEnd', 'BMX']
                );
                usuarioService.usuario = newUser;
              }
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(24);
              }
            ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              }
            ),
          ],
        ),
     ),
   );
  }
}