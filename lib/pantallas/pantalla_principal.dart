import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Seleccione un Ejercicio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Boton Ejercicio 4
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio4');
              },
              child: const Text('Ejercicio 4: Numeros Perfectos'),
            ),
            const SizedBox(height: 12),

            // Boton Ejercicio 5
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio5');
              },
              child: const Text('Ejercicio 5: Serie de Fibonacci'),
            ),
            const SizedBox(height: 12),

            // Boton Ejercicio 6
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio6');
              },
              child: const Text('Ejercicio 6: Numero Armstrong'),
            ),
          ],
        ),
      ),
    );
  }
}