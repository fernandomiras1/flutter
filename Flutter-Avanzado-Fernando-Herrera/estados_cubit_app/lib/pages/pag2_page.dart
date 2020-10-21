import 'package:estados_singleton_app/bloc/usuario/user_cubit.dart';
import 'package:estados_singleton_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userCubit = context.bloc<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = new Usuario(
                  nombre: 'Fernando Miras',
                  edad: 28,
                  profesiones: [
                    'FrontEnd',
                    'Angular',
                    'BMX'
                  ]
                );
                userCubit.seleccionarUsuario(newUser);
              }
            ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCubit.cambiarEdad(30);
              }
            ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCubit.agregarProfesion();
              }
            ),
          ],
        ),
     ),
   );
  }
}