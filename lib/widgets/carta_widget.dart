import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

// Widget que representa una tarjeta que se puede voltear para mostrar una pregunta en el frente
// y su respuesta en el reverso.
class FlipCardsWidget extends StatelessWidget {
  const FlipCardsWidget({
    super.key,
    required this.bgColor, // Color de fondo de la tarjeta.
    required this.currentIndex, // Índice actual de la tarjeta.
    required this.cardsLenght, // Número total de tarjetas.
    required this.question, // Pregunta a mostrar en el frente de la tarjeta.
    required this.answer, // Respuesta a mostrar en el reverso de la tarjeta.
    required this.currentTopic, // Tema actual de la tarjeta.
  });

  final Color bgColor;
  final int currentIndex;
  final int cardsLenght;
  final String question;
  final String answer;
  final String currentTopic;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      side: CardSide.FRONT, // Lado inicial de la tarjeta.
      front: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.hardEdge,
        children: [
          // Contenedor principal del frente de la tarjeta.
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Bordes redondeados.
              color: bgColor, // Color de fondo.
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.24), // Sombra con opacidad.
                  blurRadius: 20.0,
                  offset: const Offset(0.0, 10.0),
                  spreadRadius: 10,
                  blurStyle: BlurStyle.outer,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
                bottom: 5,
              ),
              child: Column(
                children: [
                  // Fila superior con el tema y el índice de la tarjeta.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        currentTopic,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                      ),
                      Text(
                        "$currentIndex/$cardsLenght",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Pregunta en el centro de la tarjeta.
                  Center(
                    child: Text(
                      question,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  // Texto de instrucción para voltear la tarjeta.
                  Text(
                    "Toca para dar la vuelta",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          // Decoración circular en la parte superior izquierda.
          Positioned(
            left: -120,
            top: 30,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          // Decoración circular en la parte inferior derecha.
          Positioned(
            right: -100,
            bottom: 20,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      back: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          // Contenedor principal del reverso de la tarjeta.
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Bordes redondeados.
              color: bgColor, // Color de fondo.
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Fila superior con la etiqueta "Respuesta" y el índice de la tarjeta.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Respuesta",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                      ),
                      Text(
                        "$currentIndex/$cardsLenght",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Respuesta en el centro de la tarjeta.
                  Center(
                    child: Text(
                      answer,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          // Decoración circular en la parte superior izquierda.
          Positioned(
            left: -120,
            top: 50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
