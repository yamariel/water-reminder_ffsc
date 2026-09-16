import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water/core/theme/app_theme.dart';
import 'package:water/features/hydration/presentation/providers/hydration_provider.dart';

class QuickActionButtons extends ConsumerWidget {
  const QuickActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(ref, 150),
        _buildActionButton(ref, 250),
        _buildActionButton(ref, 500),
      ],
    );
  }

  Widget _buildActionButton(WidgetRef ref, int amount) {
    return ElevatedButton(
      onPressed: () {
        ref.read(hydrationProvider.notifier).addWater(amount);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.selectedBlue,
        foregroundColor: AppTheme.primaryBlue,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        '$amount ml',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
