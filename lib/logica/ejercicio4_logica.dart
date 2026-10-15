class Ejercicio4Logica {

  int obtenerSumaDivisores(int numero) {
    int suma = 0;

    if (numero <= 1) {
      return 0;
    }

    for (int i = 1; i < numero; i++) {
      if (numero % i == 0) {
        suma += i;
      }
    }
    return suma;
  }

  bool esNumeroPerfecto(int numero) {
    if (numero <= 1) {
      return false;
    }

    int sumaDivisores = obtenerSumaDivisores(numero);

    return sumaDivisores == numero;
  }

}