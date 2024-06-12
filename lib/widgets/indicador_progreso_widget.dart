import 'dart:async';
import 'package:estudiamosfacil/views/preguntas_screen.dart';
import 'package:flutter/material.dart';

// Widget que muestra un indicador de progreso con un temporizador.
class MyProgressIndicator extends StatefulWidget {
  final List<dynamic> questionlenght; // Lista con la longitud de las preguntas.
  final dynamic optionsList; // Lista de opciones.
  final String topicType; // Tipo de tema.

  const MyProgressIndicator({
    super.key,
    required this.questionlenght,
    required this.optionsList,
    required this.topicType,
  });

  @override
  State<MyProgressIndicator> createState() => _MyProgressIndicatorState();
}

class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  int timerSeconds = 45; // Duración inicial del temporizador en segundos.
  Timer? _timer; // Instancia del temporizador.

  @override
  void initState() {
    super.initState();
    startTimer(); // Inicia el temporizador cuando el widget se inicializa.
  }

  // Función que inicia el temporizador.
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--; // Decrementa el temporizador cada segundo.
        } else {
          _timer?.cancel(); // Cancela el temporizador cuando llega a cero.
          navigateToNewScreen(); // Navega a una nueva pantalla.
        }
      });
    });
  }

  // Función que navega a la pantalla de preguntas.
  void navigateToNewScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          questionlenght: widget.questionlenght,
          optionsList: widget.optionsList,
          topicType: widget.topicType,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador cuando el widget se destruye.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA); // Color de fondo del indicador.
    return Expanded(
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(12), // Bordes redondeados del indicador.
        child: LinearProgressIndicator(
          minHeight: 20, // Altura mínima del indicador.
          value: 1 - (timerSeconds / 45), // Progreso del indicador.
          backgroundColor:
              Colors.blue.shade100, // Color de fondo del indicador.
          color: Colors.blueGrey, // Color del progreso.
          valueColor: const AlwaysStoppedAnimation(
              bgColor), // Color animado del progreso.
        ),
      ),
    );
  }
}
