class Persona {
  // Campos o propiedades
  String nombre;
  int edad;
  // _ ( es para que sea privado el metodo bio)
  String _bio = 'Hola, soy una propiedad privada.';

  // Get y sets
  // String get bio {
  //   return _bio.toUpperCase();
  // }
  String get bio => _bio.toUpperCase();

  // set bio( String texto ) {
  //   _bio = texto;
  // }
  set bio(String texto) => _bio = texto;

  // Constructores
  // Persona( int edad, String nombre ) {
  //   // print('Constructor');
  //   this.edad   = edad;
  //   this.nombre = nombre;
  // }

  // establecemos un contructor.
  Persona({this.edad = 0, this.nombre = 'Sin Nombre'});

  // creamos un nuevo constructor.
  Persona.persona30(this.nombre) {
    this.edad = 30;
  }

  // Podemos crear n cant de contrsuctores.
  Persona.persona40(String nombre) {
    this.edad = 40;
    this.nombre = nombre;
  }

  // métodos
  @override
  String toString() => '$nombre $edad $_bio';
}
