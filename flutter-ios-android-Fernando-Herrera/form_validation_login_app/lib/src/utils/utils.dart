import 'package:flutter/material.dart';

bool isNumeric(String s) {
  if (s.isEmpty) return false;
  // pregunto si se puede parcear
  final n = num.tryParse(s);

  return ( n == null) ? false : true;
}

void mostrarAlerta(BuildContext context, String mensaje) {

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: [
          FlatButton(
            // cerramos el alert
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Aceptar')
          )
        ],
      );
    },
  );

}