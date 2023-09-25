import 'package:flutter/material.dart';
import 'package:tarea3_5/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 3.5',
      theme: ThemeData(
        useMaterial3: true,
        
      ),
      home: const MyHomePage(),
    );
  }
}
