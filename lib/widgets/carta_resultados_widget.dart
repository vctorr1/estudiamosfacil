import 'package:estudiamosfacil/widgets/l%C3%ADnea_puntos_widget.dart';
import 'package:flutter/material.dart';

// Widget que muestra una tarjeta con los resultados.
class ResultsCard extends StatelessWidget {
  const ResultsCard({
    super.key,
    required this.roundedPercentageScore, // Porcentaje de puntuación redondeado.
    required this.bgColor3, // Color de fondo.
  });

  final int roundedPercentageScore; // Puntuación redondeada en porcentaje.
  final Color bgColor3; // Color de fondo para los círculos decorativos.

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 =
        Color(0xFF5170FD); // Color predeterminado para los círculos.
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.888, // Ancho basado en el tamaño de la pantalla.
      height: MediaQuery.of(context).size.height *
          0.568, // Alto basado en el tamaño de la pantalla.
      child: Stack(
        children: [
          // Tarjeta principal que contiene los resultados.
          Card(
            color: Colors.white, // Color de fondo de la tarjeta.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0), // Bordes redondeados.
            ),
            elevation: 5, // Sombra de la tarjeta.
            child: Padding(
              padding:
                  const EdgeInsets.all(8.0), // Espacio interior de la tarjeta.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign
                            .center, // Alineación del texto en el centro.
                        text: TextSpan(
                          text: "Enhorabuena!", // Texto principal.
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 21),
                          children: [
                            TextSpan(
                              text:
                                  "  \n Has obtenido  \n", // Texto secundario.
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text:
                                  "$roundedPercentageScore%", // Puntuación obtenida.
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 30,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Línea punteada horizontal.
                  CustomPaint(
                    painter: DrawDottedhorizontalline(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 25), // Espacio superior.
                        child: roundedPercentageScore >= 75
                            ? Column(
                                children: [
                                  Text(
                                    "Has ganado este trofeo", // Mensaje si la puntuación es alta.
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  // Imagen de trofeo.
                                  Image.asset("imagenes/bouncy-cup.gif",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25),
                                ],
                              )
                            : Column(
                                children: [
                                  Text(
                                    "Puedes hacerlo mejor!", // Mensaje si la puntuación es baja.
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  // Imagen de carita triste.
                                  Image.asset("imagenes/sad.png",
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.25),
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Círculo decorativo en la parte izquierda.
          Positioned(
            left: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration:
                  const BoxDecoration(color: bgColor3, shape: BoxShape.circle),
            ),
          ),
          // Círculo decorativo en la parte derecha.
          Positioned(
            right: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration:
                  const BoxDecoration(color: bgColor3, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
