class Ejercicio5Logica {
  List<int> generarFibonacci(int n) {
    if (n <= 0) {
      return [];
    }

    if (n == 1) {
      return [0];
    }

    List<int> serie = [0, 1];

    for (int i = 2; i < n; i++) {
      int siguienteTermino = serie[i - 1] + serie[i - 2];
      serie.add(siguienteTermino);
    }

    return serie;
  }
}