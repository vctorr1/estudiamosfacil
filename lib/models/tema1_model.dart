class NavigateQuestion {
  final int id;
  final String text;
  final List<NavigationsOption> options;
  bool isLocked;
  NavigationsOption? selectedWidgetOption;
  NavigationsOption? correctAnswer;

  NavigateQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  NavigateQuestion copyWith() {
    return NavigateQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              NavigationsOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWidgetOption: selectedWidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class NavigationsOption {
  final String text;
  final bool isCorrect;

  const NavigationsOption({
    required this.text,
    required this.isCorrect,
  });
}

final navigateQuestionsList = [
  NavigateQuestion(
    text: "¿Qué no es un equipo tecnológico?",
    options: [
      const NavigationsOption(
          text: "Una pantalla y un teclado", isCorrect: true),
      const NavigationsOption(
          text: "Una pantalla, ordenador, teclado y ratón", isCorrect: false),
      const NavigationsOption(text: "Un portátil.", isCorrect: false),
    ],
    id: 0,
    correctAnswer:
        const NavigationsOption(text: "Un portátil.", isCorrect: true),
  ),
  NavigateQuestion(
    text: "¿Qué es una torre?",
    options: [
      const NavigationsOption(
          text: "Un edificio de defensa en la antigüedad", isCorrect: false),
      const NavigationsOption(
          text: "Otra forma de llamar a un portátil", isCorrect: false),
      const NavigationsOption(
          text: "Otra forma de llamar a un ordenador de sobremesa",
          isCorrect: true),
    ],
    id: 1,
    correctAnswer: const NavigationsOption(
        text: "Otra forma de llamar a un ordenador de sobremesa",
        isCorrect: true),
  ),
  NavigateQuestion(
    text: "¿Qué es un teclado?",
    options: [
      const NavigationsOption(text: "Un piano electrónico", isCorrect: false),
      const NavigationsOption(
          text: "Un aparato para poder escribir en el ordenador",
          isCorrect: true),
      const NavigationsOption(
          text: "Un aparato para poder escuchar el ordenador",
          isCorrect: false),
    ],
    id: 2,
    correctAnswer: const NavigationsOption(
        text: "Un aparato para poder escribir en el ordenador",
        isCorrect: true),
  ),

  NavigateQuestion(
    text: "¿Qué es un ratón?",
    options: [
      const NavigationsOption(
          text: "Un aparato que sirve para manipular la pantalla",
          isCorrect: true),
      const NavigationsOption(
          text: "Un mamífero que se suele usar en laboratorios",
          isCorrect: false),
      const NavigationsOption(
          text: "Es un aparato que sirve para que le llegue wifi al ordenador",
          isCorrect: false),
    ],
    id: 3,
    correctAnswer: const NavigationsOption(
        text: "Un aparato que sirve para manipular la pantalla",
        isCorrect: true),
  ),
  // other 4
  NavigateQuestion(
    text: "¿Qué es una pantalla?",
    options: [
      const NavigationsOption(
          text: "Sirve para visualizar toda la información del ordenador",
          isCorrect: true),
      const NavigationsOption(
          text: "Sirve para poder controlar una aplicación", isCorrect: false),
      const NavigationsOption(
          text: "Sirve para poder ver películas gratis", isCorrect: false),
    ],
    id: 4,
    correctAnswer: const NavigationsOption(
      text: "Sirve para visualizar toda la información del ordenador",
      isCorrect: true,
    ),
  ),
  NavigateQuestion(
    text: "¿Qué es un portátil?",
    options: [
      const NavigationsOption(
          text:
              "Es un equipo informático con pantalla, ratón, teclado y altavoz, un ordenador, pero con tamaño más pequeño",
          isCorrect: true),
      const NavigationsOption(
          text:
              "Es una batería que te permite poder cargar las cosas sin enchufe",
          isCorrect: false),
      const NavigationsOption(text: "Es un tipo de pantalla", isCorrect: false),
    ],
    id: 5,
    correctAnswer: const NavigationsOption(
        text:
            "Es un equipo informático con pantalla, ratón, teclado y altavoz, un ordenador, pero con tamaño más pequeño",
        isCorrect: true),
  ),

  NavigateQuestion(
    text: "¿Qué es un escáner?",
    options: [
      const NavigationsOption(
          text: "Un dispositivo para imprimir documentos", isCorrect: false),
      const NavigationsOption(
          text:
              "Un dispositivo para digitalizar imágenes y documentos en el ordenador",
          isCorrect: true),
      const NavigationsOption(
          text: "Un dispositivo para enviar correos electrónicos",
          isCorrect: false),
    ],
    id: 6,
    correctAnswer: const NavigationsOption(
        text:
            "Un dispositivo para digitalizar imágenes y documentos en el ordenador",
        isCorrect: true),
  ),
  NavigateQuestion(
    text: "¿Qué es un disco duro?",
    options: [
      const NavigationsOption(
          text: "Un tipo de disco para jugar videojuegos", isCorrect: false),
      const NavigationsOption(
          text: "Un dispositivo para guardar información en el ordenador",
          isCorrect: true),
      const NavigationsOption(
          text: "Un dispositivo para ver películas", isCorrect: false),
    ],
    id: 7,
    correctAnswer: const NavigationsOption(
        text: "Un dispositivo para guardar información en el ordenador",
        isCorrect: true),
  ),

  NavigateQuestion(
    text: "¿Qué es un clic?",
    options: [
      const NavigationsOption(text: "Un sonido", isCorrect: false),
      const NavigationsOption(
          text: "Una acción de presionar y soltar el botón del ratón",
          isCorrect: true),
      const NavigationsOption(text: "Una ventana emergente", isCorrect: false),
    ],
    id: 8,
    correctAnswer: const NavigationsOption(
        text: "Una acción de presionar y soltar el botón del ratón",
        isCorrect: true),
  ),
];
