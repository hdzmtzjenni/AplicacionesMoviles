import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  const ItemActividad({super.key, required this.image, required this.day, required this.title});

  final String image;
  final int day;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(image,fit: BoxFit.fill,),)
            
          ),
          Text("Day $day", style: TextStyle(fontSize: 11)),
          Text("$title"),
        ],
      ),
    );
  }
}