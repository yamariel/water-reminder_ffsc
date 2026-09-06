import 'package:flutter/material.dart';

/***
 *
 * Ce widget nous a pour objectif de produit l'icon de la goutte d'eau
 */
class GoutteEauWidget extends StatelessWidget{
  const GoutteEauWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 70,
      //Definir la decoration visuelle du container
      decoration: const BoxDecoration(
        color: Color(0xFF27BCEB),
        //Definir les bordures
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: const Icon(
        Icons.water_drop,
        color: Colors.white,
        size: 48,
      ),
    );
  }
}