import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/left_scale_widget.dart';
import 'package:water/features/hydration/presentation/widgets/glass_anime_widget.dart';

class WaterProgressWidget extends StatefulWidget {
  final int consumedValue;
  final int goalOfTheDay;

  /// consumedValue : quantité d'eau consommée durant la journée.
  /// goalOfTheDay : objectif journalier en ml.
  const WaterProgressWidget({
    required this.consumedValue,
    required this.goalOfTheDay,
    super.key,
  });

  @override
  State<WaterProgressWidget> createState() =>
      _WaterProgressWidgetState();
}

class _WaterProgressWidgetState
    extends State<WaterProgressWidget> {

  late int _valeurConsommee;

  @override
  void initState() {
    super.initState();

    _valeurConsommee = widget.consumedValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ==================================================
          // ÉCHELLE
          // ==================================================

          SizedBox(
            width: 90,
            child: LeftScaleWidget(
              goalOfTheDay: widget.goalOfTheDay,
            ),
          ),

          // Petit espace entre l'échelle et le verre.
          const SizedBox(width: 10),

          // ==================================================
          // VERRE
          // ==================================================

          SizedBox(
            width: 240,
            child: GlassAnimeWidget(
              goalOfTheDay: widget.goalOfTheDay,
              consumedValue: _valeurConsommee,
            ),
          ),
        ],
      ),
    );
  }
}