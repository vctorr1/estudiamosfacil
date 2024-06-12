class Temario3 {
  final int id;
  final String text;
  final List<Temario3Option> options;
  bool isLocked;
  Temario3Option? selectedWidgetOption;
  Temario3Option? correctAnswer;

  Temario3({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  Temario3 copyWith() {
    return Temario3(
      id: id,
      text: text,
      options: options
          .map((option) =>
              Temario3Option(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWidgetOption: selectedWidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class Temario3Option {
  final String text;
  final bool isCorrect;

  const Temario3Option({
    required this.text,
    required this.isCorrect,
  });
}

final Temario3sList = [
  Temario3(
    text: "¿Qué no es un equipo tecnológico?",
    options: [
      const Temario3Option(text: "Una pantalla y un teclado", isCorrect: true),
      const Temario3Option(
          text: "Una pantalla, ordenador, teclado y ratón", isCorrect: false),
      const Temario3Option(text: "Un portátil.", isCorrect: false),
    ],
    id: 0,
    correctAnswer: const Temario3Option(text: "Un portátil.", isCorrect: true),
  ),
  Temario3(
    text: "¿Qué es una torre?",
    options: [
      const Temario3Option(
          text: "Un edificio de defensa en la antigüedad", isCorrect: false),
      const Temario3Option(
          text: "Otra forma de llamar a un portátil", isCorrect: false),
      const Temario3Option(
          text: "Otra forma de llamar a un ordenador de sobremesa",
          isCorrect: true),
    ],
    id: 1,
    correctAnswer: const Temario3Option(
        text: "Otra forma de llamar a un ordenador de sobremesa",
        isCorrect: true),
  ),
  Temario3(
    text: "¿Qué es un teclado?",
    options: [
      const Temario3Option(text: "Un piano electrónico", isCorrect: false),
      const Temario3Option(
          text: "Un aparato para poder escribir en el ordenador",
          isCorrect: true),
      const Temario3Option(
          text: "Un aparato para poder escuchar el ordenador",
          isCorrect: false),
    ],
    id: 2,
    correctAnswer: const Temario3Option(
        text: "Un aparato para poder escribir en el ordenador",
        isCorrect: true),
  ),

  Temario3(
    text: "¿Qué es un ratón?",
    options: [
      const Temario3Option(
          text: "Un aparato que sirve para manipular la pantalla",
          isCorrect: true),
      const Temario3Option(
          text: "Un mamífero que se suele usar en laboratorios",
          isCorrect: false),
      const Temario3Option(
          text: "Es un aparato que sirve para que le llegue wifi al ordenador",
          isCorrect: false),
    ],
    id: 3,
    correctAnswer: const Temario3Option(
        text: "Un aparato que sirve para manipular la pantalla",
        isCorrect: true),
  ),
  // other 4
  Temario3(
    text: "¿Qué es una pantalla?",
    options: [
      const Temario3Option(
          text: "Sirve para visualizar toda la información del ordenador",
          isCorrect: true),
      const Temario3Option(
          text: "Sirve para poder controlar una aplicación", isCorrect: false),
      const Temario3Option(
          text: "Sirve para poder ver películas gratis", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const Temario3Option(
      text: "Sirve para visualizar toda la información del ordenador",
      isCorrect: true,
    ),
  ),
  Temario3(
    text: "¿Qué es un portátil?",
    options: [
      const Temario3Option(
          text:
              "Es un equipo informático con pantalla, ratón, teclado y altavoz, un ordenador, pero con tamaño más pequeño",
          isCorrect: true),
      const Temario3Option(
          text:
              "Es una batería que te permite poder cargar las cosas sin enchufe",
          isCorrect: false),
      const Temario3Option(text: "Es un tipo de pantalla", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const Temario3Option(
        text:
            "Es un equipo informático con pantalla, ratón, teclado y altavoz, un ordenador, pero con tamaño más pequeño",
        isCorrect: true),
  ),

  Temario3(
    text: "¿Qué es un escáner?",
    options: [
      const Temario3Option(
          text: "Un dispositivo para imprimir documentos", isCorrect: false),
      const Temario3Option(
          text:
              "Un dispositivo para digitalizar imágenes y documentos en el ordenador",
          isCorrect: true),
      const Temario3Option(
          text: "Un dispositivo para enviar correos electrónicos",
          isCorrect: false),
    ],
    id: 6,
    correctAnswer: const Temario3Option(
        text:
            "Un dispositivo para digitalizar imágenes y documentos en el ordenador",
        isCorrect: true),
  ),
  Temario3(
    text: "¿Qué es un disco duro?",
    options: [
      const Temario3Option(
          text: "Un tipo de disco para jugar videojuegos", isCorrect: false),
      const Temario3Option(
          text: "Un dispositivo para guardar información en el ordenador",
          isCorrect: true),
      const Temario3Option(
          text: "Un dispositivo para ver películas", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const Temario3Option(
        text: "Un dispositivo para guardar información en el ordenador",
        isCorrect: true),
  ),

  Temario3(
    text: "¿Qué es un clic?",
    options: [
      const Temario3Option(text: "Un sonido", isCorrect: false),
      const Temario3Option(
          text: "Una acción de presionar y soltar el botón del ratón",
          isCorrect: true),
      const Temario3Option(text: "Una ventana emergente", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const Temario3Option(
        text: "Una acción de presionar y soltar el botón del ratón",
        isCorrect: true),
  ),
];
