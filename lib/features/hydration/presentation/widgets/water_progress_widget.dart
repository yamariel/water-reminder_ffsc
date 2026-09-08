import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/boutons_rapid_widget.dart';
import 'package:water/features/hydration/presentation/widgets/echelle_gauche_widget.dart';
import 'package:water/features/hydration/presentation/widgets/entete_widget.dart';
import 'package:water/features/hydration/presentation/widgets/verre_anime.dart';
import 'package:water/features/hydration/presentation/widgets/verre_widget.dart';

class WaterProgressWidget extends StatefulWidget {
  final int valuerConsommee;
  final int objectifJournalier;

  const WaterProgressWidget({
    required this.valuerConsommee,
    required this.objectifJournalier,
  });

  @override
  State<WaterProgressWidget> createState() => _WaterProgressWidgetState();
}

class _WaterProgressWidgetState extends State<WaterProgressWidget> {
  late int _valeurConsommee;
  @override
  void initState() {
    super.initState();

    _valeurConsommee = widget.valuerConsommee;
  }

  void _ajouterEau() {
    setState(() {
      _valeurConsommee += 250;

      // Empêche de dépasser l'objectif
      if (_valeurConsommee > widget.objectifJournalier) {
        _valeurConsommee = widget.objectifJournalier;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Calculer le procentage de progression

    final double progression = (_valeurConsommee / widget.objectifJournalier)
        .clamp(0.0, 1.0);

    final int pourcentage = (progression * 100).round();

    //final double progression=(valuerConsommee/objectifJournalier).clamp(0.0, 1.0);
    return SizedBox(
      height: 450,
      width: double.infinity,

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ZONE DU VERRE
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: EchelleGaucheWidget(
                    objectifJournalier: widget.objectifJournalier,
                  ),
                ),
                Expanded(
                  child: VerreAnime(
                    objectifJournalier: widget.objectifJournalier,
                    valuerConsommee: _valeurConsommee,
                  ),
                ),
              ],
            ),
          ),

          /// ZONE DU BAS
          // Column(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     Text(
          //       '$pourcentage%',
          //       style: const TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //
          //     // const Text('Progression', style: TextStyle(fontSize: 14)),
          //
          //     const SizedBox(height: 8),
          //
          //     // ElevatedButton(
          //     //   onPressed: _ajouterEau,
          //     //   child: const Text('+ 250 ml'),
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
