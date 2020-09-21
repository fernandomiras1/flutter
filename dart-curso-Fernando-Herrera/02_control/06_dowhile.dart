import 'dart:io';

main() {
  String continuar = 'y';
  int contador = 0;

  // la principal diferencia que entre en wgile y do while, es que el do while va a cumplirce al menos una vez
  // es decir, va a pasar al menos una vez en el do while
  do {
    contador++;
    stdout.writeln('Contador: $contador');

    stdout.writeln('desea continuar? (y/n)');
    continuar = stdin.readLineSync();
  } while (continuar == 'y');
}
