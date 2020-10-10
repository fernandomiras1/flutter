import 'dart:async';

class Validators {

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {

      Pattern patternEmail = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp        = new RegExp(patternEmail);
      // es un correo valido
      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Email no es correcto');
      }
    }
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        // si es mayor a 6 es valido
        sink.add(password); // deje fluir la contraseña
      } else {
        // no es valido
        sink.addError('Más de 6 caracteres por favor');
      }
    }
  );
}

