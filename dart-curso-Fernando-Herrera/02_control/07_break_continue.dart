main() {
  for (int i = 0; i < 10; i++) {
    if (i == 5) {
      // pasa a la sigueinte iteracion.Es decir no coninua. Va a imprmir todo me nos el 5
      continue;
    }

    print(i);

    if (i == 2) {
      // sale del for directamente.
      break;
    }
  }

  //
  //
}
