import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App iteso'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 9999;
  bool mail = false;
  bool phone = false;
  bool directions = false;
  bool thumb = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
        Image.network(
            'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('El ITESO, Universidad Jesuita de Guadalajara',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'San Pedro Tlaquepaque, Jal.',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            color: thumb
                                ? Colors.indigo
                                : Colors.black,
                            icon: Icon(Icons.thumb_up),
                            onPressed: () {
                              setState(() {
                                thumb = !thumb;
                              });
                              if (thumb) {
                                _incrementCounter();
                              }else{
                                _decrementCounter();
                              }
                            },
                          ),
                          Text(
                            '$_counter',
                            style:const TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    color: mail ? Colors.indigo : Colors.black,
                    onPressed: () {
                      setState(() {
                        mail = !mail;
                      });
        
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
        
                      final snackBar = SnackBar(
                        content: const Text(
                            'Puedes encontrar comida en sus cafeterías'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      );
        
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.mail),
                    iconSize: 48,
                  ),
                  const Text('Correo'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    color: phone ? Colors.indigo : Colors.black,
                    onPressed: () {
                      setState(() {
                        phone = !phone;
                      });
        
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
        
                      final snackBar = SnackBar(
                        content:
                            const Text('Puedes pedir información en rectoría'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      );
        
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.add_ic_call),
                    iconSize: 48,
                  ),
                  const Text('Llamada')
                ],
              ),
              Column(
                children: [
                  IconButton(
                    color: directions ? Colors.indigo : Colors.black,
                    onPressed: () {
                      setState(() {
                        directions = !directions;
                      });
        
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
        
                      final snackBar = SnackBar(
                        content: const Text(
                            'Se encuentra ubicado en Periférico Sur 8585'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      );
        
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.directions),
                    iconSize: 48,
                  ),
                  const Text('Ruta')
                ],
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'El ITESO, Universidad Jesuita de Guadalajara es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.',
                style: TextStyle(fontSize: 12),textAlign: TextAlign.justify,
              )),
            ],
          ),
        )
      ]),
    );
  }
}
