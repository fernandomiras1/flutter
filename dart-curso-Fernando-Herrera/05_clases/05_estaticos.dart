class Herramientas {
  // los metodos estaticos, nos conviene que se usenm de solo lectura.-
  static const List<String> listado = [
    'Martillo',
    'Llave Inglesa',
    'Desarmador'
  ];

  // de esta forma no hace falta instanaciar el listado en otro lado. Con los metodos staticos, ayuda a eso
  static void imprimirListado() => listado.forEach(print);
}

main() {
  // Herramientas.listado.add('Tenazas');

  // Herramientas.listado.forEach(print);
  Herramientas.imprimirListado();
}
