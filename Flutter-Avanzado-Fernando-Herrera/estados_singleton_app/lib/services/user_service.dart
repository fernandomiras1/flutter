import 'dart:async';

import 'package:estados_singleton_app/models/usuario.dart';

class _UsuarioService {
  
  Usuario _usuario;

  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();


  void dispose() {
    _usuarioStreamController?.close();
  }

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;


  Usuario get usuario => this._usuario;

  bool get existeUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario( Usuario user) {
    this._usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    _usuarioStreamController.add(this._usuario);
  }

}

final usuarioService = new _UsuarioService();