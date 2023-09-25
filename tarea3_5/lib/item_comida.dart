import 'package:flutter/material.dart';
import 'package:tarea3_5/data/dummy_data.dart';
import 'package:tarea3_5/detalles.dart';

class ItemComida extends StatelessWidget {
  const ItemComida({super.key, 
  required this.alimento});

  final Meal alimento;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(8.0), // Margen de 8 en todos los lados
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  children: [
                    // Fondo de imagen de comida 
                    SizedBox(
                    height: 200.0,
                    child: GestureDetector( //Cuando se de clic a la imagen 
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) =>
                                                             Detalles(alimento: alimento,)));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(alimento.imageUrl, // Ruta relativa desde los assets
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 1 / 3 * 200.0, // 1/3 de la altura de la tarjeta
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(alimento.title, style: const TextStyle(color: Colors.white,fontSize: 17, fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(
                                  height: 10,
                                ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.timer,color: Colors.white,),
                                        Text(alimento.duration.toString(),style: TextStyle(color: Colors.white),),
                                        Text('min',style: TextStyle(color: Colors.white),)
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.work,color: Colors.white,),
                                        Text(alimento.complexity,style: const TextStyle(color: Colors.white),)
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.attach_money,color: Colors.white,),
                                        Text(alimento.affordability,style: TextStyle(color: Colors.white),)
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )
                          ]),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}