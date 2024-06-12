import 'package:estudiamosfacil/widgets/carta_resultados_widget.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.whichTopic,
  });

  final int score; // Puntaje obtenido
  final int totalQuestions; // Número total de preguntas
  final String whichTopic; // Tema del test

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD); // Color de fondo
    final double percentageScore =
        (score / totalQuestions) * 100; // Cálculo del puntaje en porcentaje
    final int roundedPercentageScore =
        percentageScore.round(); // Puntaje redondeado
    const Color cardColor = Color(0xFF4993FA); // Color de las tarjetas

    return WillPopScope(
      // Evita que el usuario pueda volver atrás con el botón de retroceso
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor3,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                // Navega de regreso a la pantalla anterior
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: bgColor3,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título de la pantalla de resultados
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Resultados ",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    for (var i = 0; i < "Preguntas!".length; i++) ...[
                      TextSpan(
                        text: "Preguntas!"[i],
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 18 + i.toDouble(),
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ]
                  ],
                ),
              ),
              // Tema del test
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  whichTopic.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              // Tarjeta de resultados que muestra el puntaje
              ResultsCard(
                roundedPercentageScore: roundedPercentageScore,
                bgColor3: bgColor3,
              ),
              const SizedBox(
                height: 25,
              ),
              // Botón para hacer otro test
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width * 0.80, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                  // Navega de regreso a la pantalla anterior
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text(
                  "Hacer otro test",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
