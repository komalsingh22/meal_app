import 'package:flutter/material.dart';

class MealItemTraits extends StatelessWidget {
  const MealItemTraits({super.key, required this.icon,required this.lablel});

  final IconData icon;
  final String lablel;

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Icon(icon, size: 17,color: Colors.white),
        const SizedBox(width: 6,),
        Text(lablel,style:const  TextStyle(color: Colors.white))
      ],
    );
  }
}