main(List<String> args) {
  List<int> lista = [1, 2, 3, 4, 5];
  List<int> lista2; // null
  List<int> lista3 = [3, 1, 2, 15, -10];
  List<String> nombres = ['Tony', 'Peter'];

  print('Length: ${lista.length}');
  print('First: ${lista[0]}');
  print('First: ${lista.first}');
  print('Last: ${lista.last}');

  // esta vacia, regersa un true
  print('is empty: ${lista.isEmpty}');
  print('is empty?: ${lista2 == null}'); // true
  // trasforma una lista a un mapa (objeto con su key y value)
  print('asMap:  ${lista.asMap()}');

  Map listaMapa = lista.asMap();
  print('ListaMapa: ${listaMapa[4]}');

  Map nombreMapa = nombres.asMap();
  print('NombreMapa: ${nombreMapa}');
  print('NombreMapa: ${nombreMapa[1]}');

  print('indexOf: ${nombres.indexOf('Peter')}'); // -1

  // int mayor3 = lista.indexWhere( (numero) {

  //   if ( numero > 3 ) {
  //     return true;
  //   } else {
  //     return false;
  //   }

  // });
  int mayor3 = lista.indexWhere((numero) => (numero > 3) ? true : false);

  print('indexWhere mayor 3: $mayor3');
  // regresa un true
  print('Remove: ${nombres.remove('Tony')}');
  print('Remove: ${nombres}');

  // mezclar la lista.
  lista.shuffle();
  print('Shuffle: $lista');

  // podemos ordenar
  lista3.sort();
  print('Sort: $lista3');
  // le mayor a menor. la damos vuelta.
  print('Reverse: ${lista3.reversed.toList()}');

  nombres.forEach((nombre) {
    nombre = nombre.toUpperCase();
    print(nombre);
  });

  print('Listado: $nombres');

  final newList = nombres.map((nombre) => nombre.toUpperCase()).toList();
  print('newList: $newList');
}
