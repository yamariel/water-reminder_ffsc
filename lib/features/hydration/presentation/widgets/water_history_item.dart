import 'package:flutter/material.dart';

class WaterHistoryItem extends StatelessWidget {
  final String time;
  final int amount;
  final VoidCallback onDelete;

  const WaterHistoryItem({
    super.key,
    required this.time,
    required this.amount,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.water_drop,
              color: colorScheme.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Eau',
                style: theme.textTheme.titleMedium,
              ),
              Text(
                time,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const Spacer(),
          Text(
            '+$amount ml',
            style: theme.textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete_outline,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}