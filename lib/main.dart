import 'package:estudiamosfacil/views/inicio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// La función principal que arranca la aplicación.
void main() {
  runApp(
    const MyApp(), // Inicia la aplicación con el widget MyApp.
  );

  // Establece las orientaciones preferidas del dispositivo a solo retrato.
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp, // Permite la orientación vertical normal.
      DeviceOrientation
          .portraitDown, // Permite la orientación vertical invertida.
    ],
  );
}

// Define el widget principal de la aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta el banner de modo debug.
      title: 'MundoPC', // Título de la aplicación.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor:
              Colors.deepPurple, // Color de tema basado en un color semilla.
        ),
        useMaterial3: true, // Utiliza Material Design 3.
      ),
      home:
          const HomePage(), // Establece HomePage como la página principal de la aplicación.
    );
  }
}
