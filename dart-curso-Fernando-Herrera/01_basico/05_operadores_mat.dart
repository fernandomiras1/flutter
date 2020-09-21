/**
 *   Un operador es un símbolo que le dice al compilador
 *   qué debe de realizar una tarea 
 *   matemática, relacional o lógica 
 *   y debe de producir un resultado
 */

main() {
  int a = 10 + 5; //   +   15
  a = 20 - 10; //   -   10
  a = 10 * 2; //   *   20

  double b = 10 / 2; //   /   5
  b = 10.0 % 3; //   %   1  El sobrante de la división
  b = -b; //   -expr  Es usado para cambiar el valor de la expr

  int c = 10 ~/
      3; //   ~/  3   División común y corriente, pero solo la parte entera del prodcuto de la divicion

  int d = 1;

  d++; //  ++   2
  d--; //  --   1

  d += 2; //  +=   3  Tomar el valor el valor d y le va a sumar 2
  d -= 2; //  +=   1    *=    /=
}
