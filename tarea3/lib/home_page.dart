import 'package:flutter/material.dart';
import 'package:tarea3/info_lugar.dart';
import 'package:tarea3/item_actividad.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> activities = [
    {"title": "UBUD", "image": "assets/images/imagen-1.jpeg"},
    {"title": "Playa de Kuta", "image": "assets/images/imagen-2.jpeg"},
    {"title": "Nusa Dua", "image": "assets/images/imagen-3.jpeg"},
    {"title": "Denpasar", "image": "assets/images/imagen-4.jpeg"},
    {"title": "Pura Luhur Uluwatu", "image": "assets/images/imagen-5.jpeg"},
    {"title": "Seminyak", "image": "assets/images/imagen-6.jpeg"},
    {"title": "Volcán Batur", "image": "assets/images/imagen-7.jpeg"},
    {"title": "Playa de Sanur", "image": "assets/images/imagen-8.jpeg"},
    {"title": "Pura Besakih", "image": "assets/images/imagen-9.jpeg"},
    {"title": "Bedugul", "image": "assets/images/imagen-10.jpeg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/imagen-principal.jpeg',
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 100,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    const InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                              image: activities[index]["image"] as String,
                              day: index + 1,
                              title: activities[index]["title"] as String);
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        //Snackbar
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();

                        final snackBar = SnackBar(
                          content: const Text('Reservación en proceso...'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      color: Colors.red,
                      child: const Text(
                        "Start booking",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
