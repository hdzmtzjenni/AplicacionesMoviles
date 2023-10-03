import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';

class Multiplica extends StatefulWidget {
  const Multiplica({super.key});

  @override
  State<Multiplica> createState() => _MultiplicaState();
}

class _MultiplicaState extends State<Multiplica> {
  void _showSnackBar(int mul) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text('Numero multiplicado por $mul'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          context.watch<CounterProvider>().counter.toString(),
          style: TextStyle(fontSize: 40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().multiDos();
                  _showSnackBar(2);
                },
                child: const Text('x2')),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().multiTres();
                  _showSnackBar(3);
                },
                child: const Text('x3')),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().multiCinco();
                  _showSnackBar(5);
                },
                child: const Text('x5')),
          ],
        ),
      ],
    ));
  }
}
