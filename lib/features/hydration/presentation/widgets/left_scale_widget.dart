import 'package:flutter/material.dart';

///
/// Échelle verticale représentant le niveau d'hydratation.
/// Les grandes graduations affichent une valeur.
/// Les petites graduations servent uniquement de repère visuel.
///
class LeftScaleWidget extends StatelessWidget {
  final int goalOfTheDay;

  const LeftScaleWidget({
    required this.goalOfTheDay,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Nombre d'intervalles sur l'échelle.
    const int numberOfGraduations = 8;

    // Valeur entre deux graduations.
    final double graduationValue =
        goalOfTheDay / numberOfGraduations;

    return Column(
      children: [
        Text(
          '$goalOfTheDay ml',
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              numberOfGraduations + 1,
                  (index) {
                final double value =
                    goalOfTheDay -
                        (graduationValue * index);

                // Une graduation sur deux est principale.
                final bool isMainGraduation =
                    index % 2 == 0;

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 50,
                      child: isMainGraduation
                          ? Text(
                        '${value.round()}',
                        textAlign: TextAlign.right,
                        style: theme
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                          color: theme
                              .colorScheme
                              .primary,
                        ),
                      )
                          : null,
                    ),

                    const SizedBox(width: 5),
                    Container(
                      width: isMainGraduation
                          ? 30
                          : 20,
                      height: 2,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius:
                        BorderRadius.circular(2),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}