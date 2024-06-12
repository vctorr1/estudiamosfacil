import 'package:flutter/material.dart';

// Clase que define un CustomPainter para dibujar una línea horizontal punteada.
class DrawDottedhorizontalline extends CustomPainter {
  final Paint _paint;

  // Constructor que inicializa la pintura con las propiedades deseadas.
  DrawDottedhorizontalline() : _paint = Paint() {
    _paint.color = Colors.grey.shade400; // Color de los puntos.
    _paint.strokeWidth = 2; // Grosor de los puntos.
    _paint.strokeCap = StrokeCap.square; // Forma de los extremos de los puntos.
  }

  // Método que se encarga de dibujar en el lienzo.
  @override
  void paint(Canvas canvas, Size size) {
    // Dibuja puntos a lo largo del eje x desde -300 a 300 con un espacio de 15 unidades entre ellos.
    for (double i = -300; i < 300; i = i + 15) {
      if (i % 3 == 0) {
        // Condición para dibujar un punto (opcional).
        canvas.drawLine(
            Offset(i, 0.0), Offset(i + 10, 0.0), _paint); // Dibuja un punto.
      }
    }
  }

  // Método que indica si es necesario repintar el CustomPainter.
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // Indica que este CustomPainter no necesita repintar si no cambian sus propiedades.
  }
}
