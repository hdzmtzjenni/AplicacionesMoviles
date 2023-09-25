import 'package:flutter/material.dart';
import 'package:tarea3_5/data/dummy_data.dart';

import 'package:tarea3_5/item_comida.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 31, 20, 16) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 20, 16),
        title: const Text(
          'Quick & Easy',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyMeals.length, // Cantidad de tarjetas
        itemBuilder: (context, index) {
          return ItemComida(alimento: dummyMeals[index],);
        },
      ),
    );
  }
}
