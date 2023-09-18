import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.texto, required this.randomNumber});

  final String texto;
  final String randomNumber;

  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  String number = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Pagina 2'),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 62, 165, 248), Color.fromARGB(255, 141, 209, 240)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          
          child: Center(
            child: 
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text('Genere número random',style: GoogleFonts.sourceSans3(
                    color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(number.isEmpty? widget.randomNumber : number
                  ,style: GoogleFonts.sourceSans3(
                    color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, 
                      ),
                    ),
                    onPressed: () {
                      setState((){
                        number = Random().nextInt(1000).toString();
                      });
                    }, child: const Text('Generar')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, 
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, number);
                    }, child: const Text('Guardar')),
                ),
                  
              ],

            )),
          ),

        
        
        
    );
  }
}
