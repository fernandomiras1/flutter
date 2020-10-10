import 'dart:async';

import 'package:form_validation_login_app/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  // BehaviorSubject podemos utilizarlo porque tenmos la lib de rxdart
  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Escuchando los Stream
  Stream<String> get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  // si tenemos info de ambos string es un true, quiere decir que el email y pass son validos.
  // utilizamos el operador combineLaster para combinar el emial y pass en el flujo de informacion
  Stream<bool> get formValidStream =>
       Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el ultimo valor ingresado a los stream
  // Como usamos un BehaviorSubject tenemos el ultimo valor con el value.
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }


}