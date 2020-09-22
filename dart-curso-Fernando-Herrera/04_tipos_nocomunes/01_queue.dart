import 'dart:collection';

main() {
  // es muy util cuando tenemos una secuecna de valores. podemos usar el For tambine.
  Queue<int> cola = new Queue();
  // es una lista pero se utiliza de manera secuencial
  cola.addAll([10, 20, 30, 40, 50]);

  Iterator i = cola.iterator; // guardo el indice de la cola

  while (i.moveNext()) {
    print(i.current);
  }
}
