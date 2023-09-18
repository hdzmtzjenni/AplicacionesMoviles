import 'package:flutter/material.dart';
import 'package:tarea_repaso/second_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarea_repaso/third_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String texto = ''; //Texto del diálogo
  String number = ''; //Número guardado de pagina 2
  String figura = ''; //Cadena de la pagina 3
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.blue,
        title: const Text('Repaso'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Bienvenidos',
              style: GoogleFonts.pacifico(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/imagen-principal.png',
                      fit: BoxFit.fill),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Seleccione la acción a realizar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Ingrese datos'),
                                    content: TextField(
                                      maxLength: 10,
                                      decoration: const InputDecoration(
                                        hintText: "Ingrese palabra",
                                      ),
                                      onChanged: (value) {
                                        texto = value;
                                      },
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();

                                            Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SecondScreen(
                                                                texto: texto,
                                                                randomNumber:
                                                                    number)))
                                                .then((result) => setState(() {
                                                      number = result;
                                                    }));
                                          },
                                          child: const Text('Aceptar'))
                                    ],
                                  );
                                });
                          },
                          child: const Text('Página 2'))),
                  Expanded(child: Container()),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(
                                builder: (context) => const ThirdScreen()))
                                .then((result){
                                  setState((){
                                    figura = result;
                                  });
                                });
                          },
                          child: const Text('Página 3'))),
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Pg.2 => $texto$number',
                  style: GoogleFonts.sourceSans3(),
                )),
            const SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Pg.3 => $figura',
                  style: GoogleFonts.sourceSans3(),
                )),
          ],
        ),
      ),
    );
  }
}
