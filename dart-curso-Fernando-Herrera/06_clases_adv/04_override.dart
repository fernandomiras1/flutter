class Persona {
  String nombre;
  int edad;

  Persona(this.nombre, this.edad);

  void imprimirNombre() => print('Nombre: $nombre, Edad: $edad');
}

class Cliente extends Persona {
  String direccion;
  List ordenes = [];

  Cliente(int edadActual, String nombreActual)
      : super(nombreActual, edadActual);

  // estoy sobreescribiendo un metodo del padre. En este caso de Persona
  @override // tenemos que poner el decorador override
  void imprimirNombre() {
    super.imprimirNombre(); // es el metodo del padre.
    print('Cliente: $nombre ($edad)');
  }
}

main(List<String> args) {
  final pedro = new Cliente(33, 'Pedro');

  pedro.imprimirNombre();

  // pedro.ordenes
}
