import 'package:flutter/material.dart';
import '../logica/ejercicio6_logica.dart';

class Ejercicio6Pantalla extends StatefulWidget {
  const Ejercicio6Pantalla({super.key});

  @override
  State<Ejercicio6Pantalla> createState() => _Ejercicio6PantallaState();
}

class _Ejercicio6PantallaState extends State<Ejercicio6Pantalla> {
  // Instancia de la logica
  final Ejercicio6Logica logica = Ejercicio6Logica();

  // Controlador y variables
  final numeroCtrl = TextEditingController();

  String resultado = '';
  String cantidadCifrasTexto = '';
  String sumaPotenciasTexto = '';

  void verificarNumero() {
    final numero = int.tryParse(numeroCtrl.text);

    if (numero == null || numero <= 0) {
      setState(() {
        resultado = 'Ingrese un numero entero positivo valido';
        cantidadCifrasTexto = '';
        sumaPotenciasTexto = '';
      });
      return;
    }

    final esArmstrong = logica.esNumeroArmstrong(numero);
    final sumaCalculada = logica.obtenerSumaPotencias(numero);
    final totalCifras = numero.toString().length;

    setState(() {
      cantidadCifrasTexto = 'Cantidad de cifras: $totalCifras';
      sumaPotenciasTexto = 'Suma de sus digitos elevados: $sumaCalculada';

      if (esArmstrong) {
        resultado = 'El numero $numero es un Numero Armstrong';
      } else {
        resultado = 'El numero $numero NO es un Numero Armstrong';
      }
    });
  }

  void limpiar() {
    numeroCtrl.clear();
    setState(() {
      resultado = '';
      cantidadCifrasTexto = '';
      sumaPotenciasTexto = '';
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
        title: const Text('Ejercicio 6: Numero Armstrong'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Determinar si un numero es Armstrong',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),

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

            // Resultado
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
              cantidadCifrasTexto,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              sumaPotenciasTexto,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}