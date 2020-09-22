main() {
  String nombre = 'fernando';
  String nombre2 = capitalizar(nombre);

  // print(nombre);
  // print(nombre2);

  // Argumentos por referencia
  // Map mas elavorado.
  Map<String, String> personita = {'nombre': 'juan carlos'};

  Map<String, String> personita2 = capitalizarMapa(personita);

  print(personita);
  print(personita2);
}

// Argumentos por valor
// booleanos, string, numeros son enviados siempre por valor.
String capitalizar(String texto) {
  texto = texto.toUpperCase();
  return texto.toUpperCase();
}

// cualquier otro valor que no sea  booleanos, string, numeros. Se van a enviar por referencia.
Map<String, String> capitalizarMapa(Map<String, String> persona) {
  // Operador Spret: clonamos el objeto para que cree una nueva referencia en memoria
  persona = {...persona};

  persona['nombre'] = persona['nombre'].toUpperCase();
  return persona;
}
