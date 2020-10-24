
import 'package:estados_singleton_app/models/usuario.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

part 'user_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  
  
  UsuarioBloc() : super(UsuarioState());

  
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    // recibe un evento y cambia el estado
    // tengo que emitir un nuevo usuario.
    // yield : emite el usuarioState solo se puede usar con un async* ( va a retronar un Stream, no es un Future si no un Stream )
    
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(usuario: state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {

      final newProfesion = [
        ...state.usuario.profesiones,
        event.profesion
      ];
      yield state.copyWith(usuario: state.usuario.copyWith(profesiones: newProfesion));

    } else if (event is BorrarUsuario) {
      // estamos regresando el estado inicial de la aplicacion
      yield state.estadoInicial();
    }
    
  }


}