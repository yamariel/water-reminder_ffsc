import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoutonWidget extends StatelessWidget{
  final int valeur;
  final VoidCallback onPressed;


  BoutonWidget({super.key,required this.valeur, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Text(
              '$valeur ml',
              style: const TextStyle(
                color: Color(0xFF1748B0),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ),
    );
  }

}