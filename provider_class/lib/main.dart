import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';
import 'package:provider_class/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_)=> CounterProvider(),
      child: const MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador 2.0',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 134, 181, 248)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

