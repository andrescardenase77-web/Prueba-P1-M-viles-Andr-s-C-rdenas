import 'package:flutter/material.dart';
import 'pantallas/pantalla_principal.dart';
import 'pantallas/ejercicio4_pantalla.dart';
import 'pantallas/ejercicio5_pantalla.dart';
import 'pantallas/ejercicio6_pantalla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba P1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaPrincipal(),
        '/ejercicio4': (context) => const Ejercicio4Pantalla(),
        '/ejercicio5': (context) => const Ejercicio5Pantalla(),
        '/ejercicio6': (context) => const Ejercicio6Pantalla(),
      },
    );
  }
}