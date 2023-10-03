import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0; //variable privada, la usamos nomas en el provider

  int get counter => _counter; //variable pública

  void increment() {
    _counter++;
    notifyListeners(); //Le avisa a los listeners que cambio un dato
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void multiDos() {
    _counter = _counter * 2;
    notifyListeners();
  }

  void multiTres() {
    _counter = _counter * 3;
    notifyListeners();
  }

  void multiCinco() {
    _counter = _counter * 5;
    notifyListeners();
  }

  bool esPrimo() {
    if (_counter <= 1) {
      return false; // 0 y 1 no son primos
    }

    for (int i = 2; i <= _counter / 2; i++) {
      if (_counter % i == 0) {
        return false; // Encontramos un divisor, no es primo
      }
    }

    return true; // No encontramos divisores, es primo
  }

  Color getColor() {
  if (_counter <= 100) {
    if(_counter <=10){return Color.fromARGB(255, 199, 61, 155);}
    else if(_counter > 10 && _counter<=20){return Color.fromARGB(255, 33, 150, 243);}
    else if(_counter > 20 && _counter<=30){return Color.fromARGB(255, 61, 199, 84);}
    else if(_counter > 30 && _counter<=40){return Color.fromARGB(255, 229, 155, 36);}
    else if(_counter > 40 && _counter<=50){return Color.fromARGB(255, 215, 25, 25);}
    else if(_counter > 50 && _counter<=60){return Color.fromARGB(255, 143, 140, 142);}
    else if(_counter > 60 && _counter<=70){return Color.fromARGB(255, 101, 62, 20);}
    else if(_counter > 70 && _counter<=80){return Color.fromARGB(255, 240, 228, 59);}
    else if(_counter > 80 && _counter<=90){return Color.fromARGB(255, 243, 175, 238);}
    else if(_counter > 90 && _counter<=100){return Color.fromARGB(255, 183, 244, 199);}
  } else {
    return Color.fromARGB(255, 0, 0, 0); // Color negro para mayores de 100
  }
  return Color.fromARGB(255, 0, 0, 0);
}
}
