import 'package:flutter/material.dart';
import 'package:water/core/theme/app_theme.dart';

class EmptyWaterHistory extends StatelessWidget {
  const EmptyWaterHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 32,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: AppTheme.backgroundBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.water_drop,
              color: AppTheme.primaryBlue,
              size: 32,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pas encore d’historique',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryText,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Vous n’avez encore enregistré aucune consommation.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}