import 'package:flutter/material.dart';
import 'package:provider_class/Screens/multiplica.dart';
import 'package:provider_class/Screens/extra.dart';
import 'package:provider_class/Screens/primo.dart';
import 'package:provider_class/Screens/suma_resta.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage =0;
  final List<Widget> _pages = [
    const SumaResta(),
    const Multiplica(),
    const Primo(),
    const Extra()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contador 2.0'),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey, // Color cuando está inactivo
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.one_k), 
            label: 'sumas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.two_k), 
            label: 'multiplica'),
          BottomNavigationBarItem(
            icon: Icon(Icons.three_k), 
            label: 'primo'),
          BottomNavigationBarItem(
            icon: Icon(Icons.four_k), 
            label: 'extra'),
          
        ]
        ,),
    );
  }
}