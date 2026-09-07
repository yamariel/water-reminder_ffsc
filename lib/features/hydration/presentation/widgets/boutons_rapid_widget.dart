import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/bouton_widget.dart';

class BoutonsRapidWidget extends StatelessWidget{

  final Function(int) onSelected;

  BoutonsRapidWidget({super.key,required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BoutonWidget(valeur: 150, onPressed: onSelected(150)),
        BoutonWidget(valeur: 250, onPressed: onSelected(250)),
        BoutonWidget(valeur: 500, onPressed: onSelected(500)),
        BoutonWidget(valeur: 1000, onPressed: onSelected(1000)),
      ],
    );
  }
  
}