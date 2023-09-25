import 'package:flutter/material.dart';
import 'package:tarea3_5/data/dummy_data.dart';

class Detalles extends StatefulWidget {
  const Detalles({super.key, required this.alimento});

  final Meal alimento;
  @override
  State<Detalles> createState() => _Detalles();
}

class _Detalles extends State<Detalles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 31, 20, 16),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, // Cambia el color de la flecha de retroceso a blanco
          ),
          title: Text(widget.alimento.title,
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 31, 20, 16),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    widget.alimento.isFavorite = !widget.alimento.isFavorite;
                  });
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  final snackBar = SnackBar(
                    content: widget.alimento.isFavorite
                        ? const Text('Added to favs')
                        : const Text('Meal no longer in favs'),
                    duration: Duration(seconds: 1)
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: widget.alimento.isFavorite
                    ? const Icon(
                        Icons.star,
                      )
                    : const Icon(
                        Icons.star_border,
                      ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 250.0,
              child: Image.asset(
                widget.alimento.imageUrl, // Ruta relativa desde los assets
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                        color: Color.fromARGB(255, 223, 186, 130),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: widget.alimento.ingredients
                        .map((e) => Text(
                              e,
                              style: TextStyle(color: Colors.white),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  const Text(
                    'Steps',
                    style: TextStyle(
                        color: Color.fromARGB(255, 223, 186, 130),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: widget.alimento.steps
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
