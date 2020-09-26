class MiServicio {
  // creamos un contrstuctor privado por eso va el gion bajo
  static final MiServicio _singleton = new MiServicio
      ._internal(); // no importa el nombre. en este caso le pusimos _internal

  factory MiServicio() {
    // esa propedad va a mantener en la instancia de la clase, (unica instancia)
    return _singleton;
  }

//  1 - Contructor privado que genera una instacia privada
  MiServicio._internal();

  String url = 'https://abc';
  String key = 'ABC123';
}
