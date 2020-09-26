//abstract: no se pueden crear nuevas intancias. Sirve si queres que sea el cascaron y que se pueda extender en otra clase.
abstract class Vehiculo {
  bool encedido = false;

  void encender() {
    encedido = true;
    print('Vehículo encendido');
  }

  void apagar() {
    encedido = false;
    print('Vehículo apagado');
  }

  bool revisarMotor();
}

class Carro extends Vehiculo {
  int kilometraje = 0;

  // estoy sobreescribiendo un metodo del padre. En este caso de Vehiculo
  @override
  bool revisarMotor() {
    print('Motor OK!');
    return true;
  }
}

main() {
  // new Carro si me deja porque no es una clase abstracta
  // Pero con Vehiculo, no me dejaria porque es una clase abstracta.
  final ford = new Carro();

  ford.encender();
  ford.apagar();

  ford.revisarMotor();
}
