import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water/features/settings/presentation/providers/settings_provider.dart';
import 'package:water/features/hydration/presentation/providers/hydration_provider.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/home_header.dart';
import '../widgets/quick_action_buttons.dart';
import '../widgets/custom_water_input.dart';
import '../widgets/water_progress_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final hydrationState = ref.watch(hydrationProvider);

    final isGoalReached = hydrationState.todayTotalMl >= settings.dailyGoal;
    final percentage = (hydrationState.todayTotalMl / settings.dailyGoal * 100)
        .clamp(0, 100)
        .toInt();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            const SizedBox(height: 30),

            WaterProgressWidget(
              consumedValue: hydrationState.todayTotalMl,
              goalOfTheDay: settings.dailyGoal,
            ),

            const SizedBox(height: 12),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlue,
              ),
            ),
            const Text(
              'Progression',
              style: TextStyle(fontSize: 14, color: AppTheme.mutedText),
            ),

            const SizedBox(height: 30),

            IgnorePointer(
              // Bloque les clics si l'objectif est atteint
              ignoring: isGoalReached,
              child: Opacity(
                opacity: isGoalReached ? 0.5 : 1.0,
                child: Column(
                  children: const [
                    QuickActionButtons(),
                    SizedBox(height: 20),
                    CustomWaterInput(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
