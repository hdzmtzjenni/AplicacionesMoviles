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
      title: 'Widgets Mas utilizados',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 109, 197, 219)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool accessibility = false;
  bool timer = false;
  bool android = false;
  bool iphone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 26, 155, 241),
          centerTitle: false,
          title:
              const Text('Mc Flutter', style: TextStyle(color: Colors.white))),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: Card(
                elevation: 0, // Elevación de la tarjeta
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1), // Borde gris
                ),
                color: Colors.white, // Color de fondo de la tarjeta
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.account_circle,
                                size: 50,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Flutter McFlutter',
                                    style: TextStyle(fontSize: 20)
                                  )
                                ],
                              ),
                              Row(
                                children: [Text('Experienced App Developer',style: TextStyle(color: Colors.black),)],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Row(
                        children: [
                          Text('123 Main Street'),
                          Expanded(child: Row()),
                          Text('(415) 555-0198'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.accessibility),
                            color: accessibility == true
                                ? Colors.indigo
                                : Colors.black,
                            onPressed: () {
                              setState(() {
                                accessibility = !accessibility;
                              });

                              ScaffoldMessenger.of(context).hideCurrentSnackBar();

                              final snackBar = SnackBar(
                                content: const Text('Accessibility'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.timer),
                            color: timer == true ? Colors.indigo : Colors.black,
                            onPressed: () {
                              setState(() {
                                timer = !timer;
                              });

                              ScaffoldMessenger.of(context).hideCurrentSnackBar();

                              final snackBar = SnackBar(
                                content: const Text('Timer'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.phone_android),
                            color: android == true ? Colors.indigo : Colors.black,
                            onPressed: () {
                              setState(() {
                                android = !android;
                              });

                              ScaffoldMessenger.of(context).hideCurrentSnackBar();

                              final snackBar = SnackBar(
                                content: const Text('Android'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.phone_iphone),
                            color:
                                iphone == true ? Colors.indigo : Colors.black,
                            onPressed: () {
                              setState(() {
                                iphone = !iphone;
                              });

                              ScaffoldMessenger.of(context).hideCurrentSnackBar();

                              final snackBar = SnackBar(
                                content: const Text('iphone'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {},
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
