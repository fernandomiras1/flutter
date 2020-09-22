main(List<String> args) {
  // saludar( 'Hola', 'Fernando' );

  // no importa como envie los nombres
  saludar2(veces: 10, mensaje: 'Hola', nombre: 'Fernando');
}

// Argumentos posicionales y luego estan los argumentos por nombre

// los que estaan entre [] son valores opcionales
// argumentos posicionales
void saludar(String mensaje, [String nombre = '<insertar nombre>']) {
  print('$mensaje $nombre');
}

// cuando lo marcamos, se convierte argumetnos por nombre
void saludar2({String nombre, String mensaje, int veces}) {
  for (var i = 0; i < veces; i++) {
    print('$mensaje $nombre');
  }
}
