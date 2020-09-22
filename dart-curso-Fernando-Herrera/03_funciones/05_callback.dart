main() {
  obtenerUsuario('100', (Map persona) {
    print(persona);
  });
}

// callback; es una Fn que se llama detro de otra funcion
void obtenerUsuario(String id, Function callback) {
  Map usuario = {'id': id, 'nombre': 'Juan Carlos'};

  callback(usuario);
}
