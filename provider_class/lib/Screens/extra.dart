import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_class/Providers/counter_provider.dart';
class Extra extends StatefulWidget {
  const Extra({super.key});

  @override
  State<Extra> createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<CounterProvider>().getColor(),
    );
  }
}