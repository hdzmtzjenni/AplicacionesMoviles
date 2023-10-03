import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';
class Primo extends StatefulWidget {
  const Primo({super.key});

  @override
  State<Primo> createState() => _PrimoState();
}

class _PrimoState extends State<Primo> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Primo',style: TextStyle(fontSize: 30, 
      color: context.watch<CounterProvider>().esPrimo() == true ? Colors.green: Colors.blue),),
    );
  }
}