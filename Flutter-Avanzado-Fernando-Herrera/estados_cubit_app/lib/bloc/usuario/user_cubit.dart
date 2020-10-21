import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados_singleton_app/models/usuario.dart';
// archivo padre
part 'user_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  // se llama el contructor llama al UsuarioInitial
  UsuarioCubit() : super( UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    // emitir un nuevo estado
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    //cambiar el estado
    final currentState = state;
    // si hay un usuario activo
    if (currentState is UsuarioActivo) {
      // de esta forma no mutamos, siempre estamos regresando un nuevo estado.
      final newUser = currentState.usuario.copyWith(edad: 30);
      // regresamos una nueva instancia de usuairo.

      // emitimos un nuevo usuario.
      emit(UsuarioActivo(newUser));
    }
  }
  void agregarProfesion() {
    //cambiar el estado
    final currentState = state;
    // si hay un usuario activo
    if (currentState is UsuarioActivo) {
      // de esta forma no mutamos, siempre estamos regresando un nuevo estado.
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${ currentState.usuario.profesiones.length + 1 }'
      ];
      final newUser = currentState.usuario.copyWith(profesiones: newProfesiones);
      // regresamos una nueva instancia de usuairo.

      // emitimos un nuevo usuario.
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }

}