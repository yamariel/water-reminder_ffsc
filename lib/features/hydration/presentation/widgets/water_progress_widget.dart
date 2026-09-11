import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/left_scale_widget.dart';
import 'package:water/features/hydration/presentation/widgets/glass_anime_widget.dart';

class WaterProgressWidget extends StatefulWidget {
  final int consumedValue;
  final int goalOfTheDay;

  /**
   * @valuerConsommee valeur d'eau consommee durant la journee en cours
   * @objectifJournalier l'objectif journalier defini
   */
  const WaterProgressWidget({
    required this.consumedValue,
    required this.goalOfTheDay,
    super.key
  });

  @override
  State<WaterProgressWidget> createState() => _WaterProgressWidgetState();
}

class _WaterProgressWidgetState extends State<WaterProgressWidget> {
  late int _valeurConsommee;
  @override
  void initState() {
    super.initState();

    _valeurConsommee = widget.consumedValue;
  }
  @override
  Widget build(BuildContext context) {
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
                  child: LeftScaleWidget(
                    goalOfTheDay: widget.goalOfTheDay,
                  ),
                ),
                Expanded(

                  child: GlassAnimeWidget(
                    goalOfTheDay: widget.goalOfTheDay,
                    consumedValue: _valeurConsommee,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
