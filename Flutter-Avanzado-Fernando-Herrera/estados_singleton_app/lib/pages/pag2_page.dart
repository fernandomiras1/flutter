import 'package:estados_singleton_app/models/usuario.dart';
import 'package:estados_singleton_app/services/user_service.dart';
import 'package:flutter/material.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
             return snapshot.hasData 
             ? Text('Nombre: ${snapshot.data.nombre}')
             : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {

                final user = new Usuario(
                  nombre: 'Fer',
                  edad: 24,
                
                );
                usuarioService.cargarUsuario(user);
              }
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              }
            ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}
            ),
          ],
        ),
     ),
   );
  }
}