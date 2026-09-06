import 'package:flutter/cupertino.dart';
import 'package:water/features/hydration/presentation/widgets/echelle_gauche_widget.dart';
import 'package:water/features/hydration/presentation/widgets/entete_widget.dart';
import 'package:water/features/hydration/presentation/widgets/verre_widget.dart';

class WaterProgressWidget extends StatelessWidget{
  final int valuerConsommee;
  final int objectifJournalier;


  const WaterProgressWidget({
    required this.valuerConsommee,
    required this.objectifJournalier
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Calculer le procentage de progression
    final double progression=(valuerConsommee/objectifJournalier).clamp(0.0, 1.0);
    return SizedBox(
      height: 350,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ÉCHELLE
          EchelleGaucheWidget(objectifJournalier:objectifJournalier),


          /// VERRE
          VerreWidget(progression: valuerConsommee/objectifJournalier, valuerConsommee: valuerConsommee),

          const SizedBox(width: 20),
        ],
      ),
    );
  }


}