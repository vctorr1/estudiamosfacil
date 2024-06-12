import 'package:estudiamosfacil/models/tema4_model.dart'; // Importa el modelo para el tema 4.
import 'package:estudiamosfacil/models/tema1_model.dart'; // Importa el modelo para el tema 1.
import 'package:estudiamosfacil/models/tema2_model.dart'; // Importa el modelo para el tema 2.
import 'package:estudiamosfacil/models/tema3_model.dart'; // Importa el modelo para el tema 3.
import 'package:flutter/cupertino.dart'; // Importa el paquete de widgets de Cupertino para Flutter.

const Color cardColor =
    Color(0xFF4993FA); // Color constante para las tarjetas de los temas.

class FlutterTopics {
  final int id; // Identificador único para el tema.
  final String topicName; // Nombre del tema.
  final IconData topicIcon; // Icono representativo del tema.
  final Color topicColor; // Color del tema.
  final List<dynamic> topicQuestions; // Lista de preguntas para el tema.

  // Constructor para inicializar las propiedades del tema.
  FlutterTopics({
    required this.id,
    required this.topicColor,
    required this.topicIcon,
    required this.topicName,
    required this.topicQuestions,
  });
}

// Lista de temas con sus propiedades y preguntas correspondientes.
final List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    id: 0,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.square_stack_3d_up, // Icono de pila de cuadrados.
    topicName: "Informática general", // Nombre del tema.
    topicQuestions:
        Temario2sList, // Lista de preguntas para "Informática general".
  ),
  FlutterTopics(
    id: 1,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.keyboard, // Icono de teclado.
    topicName: "Ofimática", // Nombre del tema.
    topicQuestions: Temario3sList, // Lista de preguntas para "Ofimática".
  ),
  FlutterTopics(
    id: 2,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.settings, // Icono de configuración.
    topicName: "Hardware", // Nombre del tema.
    topicQuestions: Temario1sList, // Lista de preguntas para "Hardware".
  ),
  FlutterTopics(
    id: 3,
    topicColor: cardColor,
    topicIcon: CupertinoIcons.list_number, // Icono de lista numerada.
    topicName: "Software", // Nombre del tema.
    topicQuestions: Temario4sList, // Lista de preguntas para "Software".
  ),
];
