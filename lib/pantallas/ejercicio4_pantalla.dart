import 'package:flutter/material.dart';
import '../logica/ejercicio4_logica.dart';

class Ejercicio4Pantalla extends StatefulWidget {
  const Ejercicio4Pantalla({super.key});

  @override
  State<Ejercicio4Pantalla> createState() => _Ejercicio4PantallaState();
}

class _Ejercicio4PantallaState extends State<Ejercicio4Pantalla> {
  // Instancia de la logica
  Ejercicio4Logica logica = Ejercicio4Logica();

  // Variables y controlador
  final numeroCtrl = TextEditingController();

  // Variables para mostrar resultados
  String resultado = '';
  String detalleSuma = '';

  void verificarNumero() {
    final numero = int.tryParse(numeroCtrl.text);

    if (numero == null || numero <= 0) {
      setState(() {
        resultado = 'Ingrese un numero entero positivo valido';
        detalleSuma = '';
      });
      return;
    }

    final esPerfecto = logica.esNumeroPerfecto(numero);
    final suma = logica.obtenerSumaDivisores(numero);

    setState(() {
      detalleSuma = 'Suma de divisores propios: $suma';
      if (esPerfecto) {
        resultado = 'El numero $numero es un Numero Perfecto';
      } else {
        resultado = 'El numero $numero NO es un Numero Perfecto';
      }
    });
  }

  void limpiar() {
    numeroCtrl.clear();
    setState(() {
      resultado = '';
      detalleSuma = '';
    });
  }

  @override
  void dispose() {
    numeroCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 4: Numeros Perfectos'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Determinar si un numero es perfecto',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),

            // Ingresar el numero
            TextField(
              controller: numeroCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Ingrese un numero entero positivo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificarNumero,
                  child: const Text('Verificar'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: limpiar,
                  child: const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Mostrar el resultado
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              detalleSuma,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}