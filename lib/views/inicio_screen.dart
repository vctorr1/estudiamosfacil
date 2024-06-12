import 'package:estudiamosfacil/models/temas_model.dart';
import 'package:estudiamosfacil/views/cartas_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA); // Color de las tarjetas
    const Color bgColor3 = Color(0xFF5170FD); // Color de fondo de la pantalla

    return Scaffold(
      backgroundColor: bgColor3,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // Contenedor para el logotipo
              Container(
                decoration: BoxDecoration(
                  color: bgColor3,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.24),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                      spreadRadius: -10,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: Image.asset(
                  "imagenes/logo_mundopc.png",
                  scale: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Texto centrado
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Practica Divirtiéndote!",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 21,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // GridView para mostrar las tarjetas de temas
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas
                  mainAxisSpacing: 10, // Espaciado entre filas
                  crossAxisSpacing: 10, // Espaciado entre columnas
                  childAspectRatio:
                      0.85, // Relación de aspecto de los elementos
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: flutterTopicsList.length, // Número de temas
                itemBuilder: (context, index) {
                  final topicsData = flutterTopicsList[index];
                  return GestureDetector(
                    onTap: () {
                      // Navega a la pantalla de tarjetas cuando se toca una tarjeta
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCard(
                            typeOfTopic: topicsData.topicQuestions,
                            topicName: topicsData.topicName,
                          ),
                        ),
                      );
                      print(topicsData.topicName); // Imprime el nombre del tema
                    },
                    child: Card(
                      color: bgColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              topicsData.topicIcon,
                              color: Colors.white,
                              size: 55,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              topicsData.topicName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
