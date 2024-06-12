import 'dart:async';

import 'package:estudiamosfacil/views/resultados_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String topicType; // Tipo de tema del cuestionario
  final List<dynamic> questionlenght; // Lista de preguntas
  final dynamic optionsList; // Lista de opciones para cada pregunta

  const QuizScreen({
    super.key,
    required this.questionlenght,
    required this.optionsList,
    required this.topicType,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionTimerSeconds = 20; // Duración del temporizador de la pregunta
  Timer? _timer; // Temporizador
  int _questionNumber = 1; // Número de la pregunta actual
  PageController _controller = PageController(); // Controlador de la página
  int score = 0; // Puntaje del cuestionario
  bool isLocked = false; // Indicador de bloqueo de pregunta
  List optionsLetters = [
    "A.",
    "B.",
    "C.",
    "D."
  ]; // Letras para las opciones de respuesta

  // Inicia el temporizador para las preguntas
  void startTimerOnQuestions() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (questionTimerSeconds > 0) {
            questionTimerSeconds--;
          } else {
            _timer?.cancel();
            navigateToNewScreen();
          }
        });
      }
    });
  }

  // Detiene el temporizador
  void stopTime() {
    _timer?.cancel();
  }

  // Navega a la siguiente pregunta o a la pantalla de resultados
  void navigateToNewScreen() {
    if (_questionNumber < widget.questionlenght.length) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() {
        _questionNumber++;
        isLocked = false;
      });
      _resetQuestionLocks();
      startTimerOnQuestions();
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            score: score,
            totalQuestions: widget.questionlenght.length,
            whichTopic: widget.topicType,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _resetQuestionLocks();
    startTimerOnQuestions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color bgColor = Color(0xFF4993FA);

    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) => route.isFirst);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: bgColor3,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Encabezado del cuestionario
                Row(
                  children: [
                    Text(
                      "Preguntas de ${widget.topicType}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Temporizador de pregunta
                Padding(
                  padding: const EdgeInsets.only(right: 14, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.white,
                          weight: 10,
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: LinearProgressIndicator(
                            minHeight: 20,
                            value: 1 - (questionTimerSeconds / 20),
                            backgroundColor: Colors.blue.shade100,
                            color: Colors.blueGrey,
                            valueColor: const AlwaysStoppedAnimation(bgColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Contenedor de la pregunta actual
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.24),
                        blurRadius: 20.0,
                        offset: const Offset(0.0, 10.0),
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Número de la pregunta actual
                          Text(
                            "Pregunta $_questionNumber/${widget.questionlenght.length}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: _controller,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.questionlenght.length,
                              onPageChanged: (value) {
                                setState(() {
                                  _questionNumber = value + 1;
                                  isLocked = false;
                                  _resetQuestionLocks();
                                });
                              },
                              itemBuilder: (context, index) {
                                final myquestions =
                                    widget.questionlenght[index];
                                var optionsIndex = widget.optionsList[index];

                                return Column(
                                  children: [
                                    // Texto de la pregunta actual
                                    Text(
                                      myquestions.text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 18,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: myquestions.options.length,
                                        itemBuilder: (context, index) {
                                          var color = Colors.grey.shade200;

                                          var questionOption =
                                              myquestions.options[index];
                                          final letters = optionsLetters[index];

                                          // Cambia el color de fondo de la opción según la respuesta seleccionada y si está bloqueada
                                          if (myquestions.isLocked) {
                                            if (questionOption ==
                                                myquestions
                                                    .selectedWidgetOption) {
                                              color = questionOption.isCorrect
                                                  ? Colors.green
                                                  : Colors.red;
                                            } else if (questionOption
                                                .isCorrect) {
                                              color = Colors.green;
                                            }
                                          }
                                          return InkWell(
                                            onTap: () {
                                              print(optionsIndex);
                                              stopTime();
                                              if (!myquestions.isLocked) {
                                                setState(() {
                                                  myquestions.isLocked = true;
                                                  myquestions
                                                          .selectedWidgetOption =
                                                      questionOption;
                                                });

                                                isLocked = myquestions.isLocked;
                                                if (myquestions
                                                    .selectedWidgetOption
                                                    .isCorrect) {
                                                  score++;
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: color),
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "$letters ${questionOption.text}",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                  // Icono de verificación o cancelación para mostrar si la opción es correcta o incorrecta
                                                  isLocked == true
                                                      ? questionOption.isCorrect
                                                          ? const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          : const Icon(
                                                              Icons.cancel,
                                                              color: Colors.red,
                                                            )
                                                      : const SizedBox.shrink()
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          // Botón para pasar a la siguiente pregunta o a los resultados
                          isLocked
                              ? buildElevatedButton()
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Restablece el estado de bloqueo de preguntas
  void _resetQuestionLocks() {
    for (var question in widget.questionlenght) {
      question.isLocked = false;
    }
    questionTimerSeconds = 20;
  }

  // Construye un botón elevado para pasar a la siguiente pregunta o a los resultados
  ElevatedButton buildElevatedButton() {
    const Color cardColor = Color(0xFF4993FA);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(cardColor),
        elevation: MaterialStateProperty.all(4),
      ),
      onPressed: () {
        if (_questionNumber < widget.questionlenght.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
          setState(() {
            _questionNumber++;
            isLocked = false;
          });
          _resetQuestionLocks();
          startTimerOnQuestions();
        } else {
          _timer?.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(
                score: score,
                totalQuestions: widget.questionlenght.length,
                whichTopic: widget.topicType,
              ),
            ),
          );
        }
      },
      child: SizedBox(
        // Envuelve el texto del botón en SizedBox
        width: double
            .infinity, // Establece el ancho para que coincida con el padre
        child: Text(
          _questionNumber < widget.questionlenght.length
              ? 'Siguiente pregunta'
              : 'Resultados',
          textAlign: TextAlign.center, // Centra el texto
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
