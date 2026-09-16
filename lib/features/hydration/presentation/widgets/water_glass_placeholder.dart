import 'package:flutter/material.dart';
import 'package:water/core/theme/app_theme.dart';

/// Règle graduée + espace réservé pour le verre animé.

class GraduationAndGlassPlaceholder extends StatelessWidget {
  final int currentAmountMl;
  final int goalAmountMl;

  const GraduationAndGlassPlaceholder({
    super.key,
    required this.currentAmountMl,
    required this.goalAmountMl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${goalAmountMl}ml', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            ...List.generate(
              8,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Container(width: 20, height: 2, color: AppTheme.waterBlueLight),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.waterBlueLight, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              '${currentAmountMl}ml\n(placeholder verre —\nà remplacer par le\nwidget d\'Abdoul)',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.waterBlue),
            ),
          ),
        ),
      ],
    );
  }
}