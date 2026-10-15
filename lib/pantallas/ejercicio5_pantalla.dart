import 'package:flutter/material.dart';
import '../logica/ejercicio5_logica.dart';

class Ejercicio5Pantalla extends StatefulWidget {
  const Ejercicio5Pantalla({super.key});

  @override
  State<Ejercicio5Pantalla> createState() => _Ejercicio5PantallaState();
}

class _Ejercicio5PantallaState extends State<Ejercicio5Pantalla> {
  // Instancia de la logica
  final Ejercicio5Logica logica = Ejercicio5Logica();

  // Variables y controlador
  final cantidadCtrl = TextEditingController();

  String resultado = '';

  void generarSerie() {
    final cantidad = int.tryParse(cantidadCtrl.text);

    if (cantidad == null || cantidad <= 0) {
      setState(() {
        resultado = 'Ingrese un numero entero positivo valido';
      });
      return;
    }

    final listaSerie = logica.generarFibonacci(cantidad);

    setState(() {
      resultado = 'Serie generada: \n${listaSerie.join(', ')}';
    });
  }

  void limpiar() {
    cantidadCtrl.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    cantidadCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 5: Serie de Fibonacci'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Generar N terminos de Fibonacci',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),

            // Cantidad de terminos
            TextField(
              controller: cantidadCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese la cantidad de terminos (N)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: generarSerie,
                  child: const Text('Generar'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: limpiar,
                  child: const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Serie generada
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}