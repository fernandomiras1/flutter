main(List<String> args) {
  // Documetancion en dart: https://api.dart.dev/stable/2.4.1/dart-core/double-class.html

  double numero = 2.1416;
  double infinito = double.infinity;

  print('Firma: ${numero.sign} :: $numero');

  print('isFinite: ${numero.isFinite} :: $numero');
  print('isFinite: ${infinito.isFinite} :: $infinito');

  print('abs: ${numero.abs()} :: $numero');
  print('ceil: ${numero.ceil()} :: $numero');

  // print('ceil: ${ infinito.ceil() } :: $numero');

  print('ceilToDouble: ${numero.ceilToDouble()} :: $numero');

  // redonde en entero 3.5 => 4
  print('round: ${numero.round()} :: $numero');
  // redondea en doble ejemplo: 3.5 => 4.0
  print('round: ${numero.roundToDouble()} :: $numero');

  print('clamp: ${numero.clamp(1, 3)} :: $numero');
}
