import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class DailyGoalCard extends StatelessWidget {
  const DailyGoalCard({super.key, required this.goal});

  final int goal;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppTheme.primaryBlue, AppTheme.goalCardBlueLight],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          child: Column(
            children: [
              Text(
                'Objectif quotidien recommandé',
                style: TextStyle(
                  color: colors.onPrimary.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '$goal ml',
                style: TextStyle(
                  color: colors.onPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Calculé selon votre poids, votre genre et votre rythme d’éveil',
                style: TextStyle(
                  color: colors.onPrimary.withValues(alpha: 0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
