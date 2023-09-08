import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var servController = TextEditingController();
  double? tipPer = 0.00;
  double? tipPerAnterior = 0.00;
  double? cost2 = 0.00;
  int divisa = 0;
  int divisaAnterior = 0;
  double tipAmount = 0.00;
  bool round = false;

  void calculateTip() {
    setState(() {
      double? cost = double.tryParse(servController.text);

      if (cost == null || divisa == 0 || tipPer == 0.0) {
        tipAmount = 0;
        showEmptyDialog();
      } else {
        if (cost == cost2) {
          //Es el mismo costo
          if (tipPer == tipPerAnterior) {
            //Es el mismo porcentaje
            //Solo se cambio la divisa
            if (divisa != divisaAnterior) {
              //Es diferente divisa
              calcularDivisa();
              divisaAnterior = divisa; //Se actualiza divisaAnterior
            }
          } else {
            //Es diferente porcentaje
            tipPerAnterior = tipPer; //Se actualiza porcentaje anterior
            //se cambia el porcentaje
            double costTemp = cost * tipPer!; //Sacar el precio más la propina
            double tip = costTemp - cost; //obtener unicamente la propina
            tipAmount = tip;
          }
        } else {
          //Es diferente costo
          cost2 = cost;
          tipPerAnterior = tipPer;

          //Se calcula propina y divisa
          
            double costTemp = cost * tipPer!; //Sacar el precio más la propina
            double tip = costTemp - cost; //obtener unicamente la propina
            tipAmount = tip;
            calcularDivisa();
            divisaAnterior = divisa; //Se actualiza divisa anterior
          
        }
      }

      if (round) {
        tipAmount = tipAmount.ceil().toDouble();
      } else {
        tipAmount = double.parse(tipAmount.toStringAsFixed(2));
      }
    });
  }

  showEmptyDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Empty'),
            content: const Text('Complete all the information'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Okay'))
            ],
          );
        });
  }

  void calcularDivisa() {
    setState(() {
      if (divisa == 1) {
        //Si se quiere cambiar a pesos
        if (divisaAnterior == 2) {
          //De dolar a peso
          tipAmount = tipAmount * 20;
        } else if (divisaAnterior == 3) {
          //De Euro a peso
          tipAmount = tipAmount * 18.72;
        } else {
          tipAmount = tipAmount;
        }
      } else if (divisa == 2) {
        if (divisaAnterior == 1) {
          //De peso a dolar
          tipAmount = tipAmount / 20;
        } else if (divisaAnterior == 3) {
          //De Euro a dolar
          tipAmount = tipAmount * 1.07;
        } else {
          tipAmount = tipAmount;
        }
      } else if (divisa == 3) {
        if (divisaAnterior == 1) {
          //De peso a euro
          tipAmount = tipAmount / 18.72;
        } else if (divisaAnterior == 2) {
          //De Dolar a euro
          tipAmount = tipAmount / 1.07;
        } else {
          tipAmount = tipAmount;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Tip Time'),
          centerTitle: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: servController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    icon: Icon(Icons.store_mall_directory),
                    iconColor: Colors.green,
                    labelText: "Cost of Service:",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 18,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.room_service,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10.0),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('How was the service?:',
                        style: TextStyle(fontSize: 16.0)),
                  ),
                ],
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Amazing (20%)'),
                    value: 1.2,
                    groupValue: tipPer,
                    onChanged: (double? value) {
                      setState(() {
                        tipPer = value;
                      });
                    },
                  ),
                  RadioListTile(
                      title: const Text('Good (18%)'),
                      value: 1.18,
                      groupValue: tipPer,
                      onChanged: (double? value) {
                        setState(() {
                          tipPer = value;
                        });
                      }),
                  RadioListTile(
                      title: const Text('Okay (15%)'),
                      value: 1.15,
                      groupValue: tipPer,
                      onChanged: (double? value) {
                        setState(() {
                          tipPer = value;
                        });
                      })
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Round up tip?',
                              style: TextStyle(fontSize: 16.0)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Switch(
                        value: round,
                        onChanged: (value) {
                          setState(() {
                            round = value;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.room_service,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10.0),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Divisa:', style: TextStyle(fontSize: 16.0)),
                  ),
                ],
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Peso'),
                    value: 1,
                    groupValue: divisa,
                    onChanged: (value) {
                      setState(() {
                        divisa = value as int;
                      });
                    },
                  ),
                  RadioListTile(
                      title: const Text('Dolar'),
                      value: 2,
                      groupValue: divisa,
                      onChanged: (value) {
                        setState(() {
                          divisa = value as int;
                        });
                      }),
                  RadioListTile(
                      title: const Text('Euro'),
                      value: 3,
                      groupValue: divisa,
                      onChanged: (value) {
                        setState(() {
                          divisa = value as int;
                        });
                      })
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: double.maxFinite,
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    calculateTip();
                  },
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Tip amount: \$ $tipAmount',
                    style: const TextStyle(fontSize: 16.0),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
