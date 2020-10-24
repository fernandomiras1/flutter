
// es el hijo por eso es el of parte del padre.
part of 'user_bloc.dart';
class UsuarioState {
  // son estados inmutables.
  final bool existeUsuario;
  final Usuario usuario;

  // lo podemos hacer entre llaves, pero con los : es una forma corta de hacerlo.
  UsuarioState({ Usuario user}) 
  // inicializamos 
  : usuario = user ?? null, // si no tiene usuario va a ser null
    existeUsuario = ( user != null) ? true : false;

  UsuarioState copyWith({ Usuario usuario }) => UsuarioState(
    user: usuario ?? this.usuario
  );

  UsuarioState estadoInicial() => new UsuarioState();
  
}