import 'dart:math';

class Ejercicio6Logica {
  int obtenerSumaPotencias(int numero) {
    if (numero <= 0) {
      return 0;
    }

    String numeroTexto = numero.toString();
    int cantidadCifras = numeroTexto.length;
    int suma = 0;

    for (int i = 0; i < cantidadCifras; i++) {
      int digito = int.parse(numeroTexto[i]);
      suma += pow(digito, cantidadCifras).toInt();
    }

    return suma;
  }

  bool esNumeroArmstrong(int numero) {
    if (numero <= 0) {
      return false;
    }

    int sumaCalculada = obtenerSumaPotencias(numero);

    return sumaCalculada == numero;
  }
}