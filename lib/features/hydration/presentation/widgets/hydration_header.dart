import 'package:flutter/material.dart';
import 'package:water/core/theme/app_theme.dart';

/// En-tête de la home page : mascotte + bulle de conseil.
class HydrationHeader extends StatelessWidget {
  final String message;

  const HydrationHeader({
    super.key,
    this.message = "N'attendez pas d'avoir soif pour boire.",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/goutte.jpg'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(message, style: Theme.of(context).textTheme.labelLarge),
          ),
        ),
      ],
    );
  }
}