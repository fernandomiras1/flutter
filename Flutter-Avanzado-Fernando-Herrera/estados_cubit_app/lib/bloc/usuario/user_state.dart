// es una parte del cubit
part of 'user_cubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {

  final existeUsuario = false;

}

class UsuarioActivo extends UsuarioState {

  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);

}

