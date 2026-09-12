import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/left_scale_widget.dart';
import 'package:water/features/hydration/presentation/widgets/glass_anime_widget.dart';

class WaterProgressWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: LeftScaleWidget(
              goalOfTheDay: this.goalOfTheDay,
            ),
          ),
          // Petit espace entre l'échelle et le verre.
          const SizedBox(width: 10),
          SizedBox(
            width: 240,
            child: GlassAnimeWidget(
              goalOfTheDay: this.goalOfTheDay,
              consumedValue: this.consumedValue,
            ),
          ),
        ],
      ),
    );

  }
}