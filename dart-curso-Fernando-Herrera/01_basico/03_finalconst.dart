main() {
  var a = 10;
  // no van a cambiar despues de su inizializacion
  final double b = 10; // es mas ligera en memoria
  const double c = 10;

  // a = 20;
  // b = 20;
  // c = 20;

  // final personasFinal = ['Juan', 'Pedro', 'Fernando'];
  // const personasConst = ['Juan', 'Pedro', 'Fernando'];

  // se recomienda usar final.
  // la fiferencia entre final y const es que const no me permite modificar la lista.

  final List<String> personasFinal = ['Juan', 'Pedro', 'Fernando'];
  List<String> personasConst = const ['Juan', 'Pedro', 'Fernando'];

  personasFinal.add('Maria');
  // personasConst.add('Maria');

  // personasFinal = [];

  print(personasConst);
}
