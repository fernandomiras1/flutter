import 'dart:async';

main() {
  // Basicamente es una corriente de datos, un flujo de informacion
  // son como los Observables de las extenciones reactivas

  // final streamController = new StreamController<String>();
  // broadcast: permite multiples subscipciones
  final streamController = new StreamController<String>.broadcast();

  // listen = subscribe en RXJS
  streamController.stream.listen((data) => print('Despegando! $data'),
      onError: (err) => print('Error! $err'),
      // cuando se termina el flujo de datos.
      onDone: () => print('Misión completa!'),
      cancelOnError: false); // cancelamos el stream cuando se recive un error

  streamController.stream.listen((data) => print('Despegando Stream 2! $data'),
      onError: (err) => print('Error Stream 2! $err'),
      onDone: () => print('Misión completa Stream 2!'),
      cancelOnError: false);

  // sink: agregar un nuvo elemento al flujo de datos.
  streamController.sink.add('Apollo 11');
  streamController.sink.add('Apollo 12');
  streamController.sink.add('Apollo 13');
  streamController.sink.addError('Houston, Tenemos un problema!');
  streamController.sink.add('Apollo 14');
  streamController.sink.add('Apollo 15');

  // seria como el undiscrbie. Cerramos el flujo de datos.
  streamController.sink.close();

  print('Fin del main');
}
