import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:water/features/hydration/presentation/providers/hydration_provider.dart';
import '../providers/daily_goal_provider.dart';
import '../widgets/hydration_header.dart';
import '../widgets/water_glass_placeholder.dart';
import '../widgets/progress_label.dart';
import '../widgets/quick_amount_buttons.dart';
import '../widgets/free_amount_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hydrationState = ref.watch(hydrationProvider);
    final goalAmountMl = ref.watch(dailyGoalProvider);

    if (hydrationState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentAmountMl = hydrationState.todayTotalM1; // ⚠️ chiffre 1, pas la lettre l
    final progressPercent = (currentAmountMl / goalAmountMl).clamp(0.0, 1.0) * 100;

    void addWater(int amountMl) {
      ref.read(hydrationProvider.notifier).addWater(amountMl);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('WaterReminder')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HydrationHeader(),
              const SizedBox(height: 24),
              GraduationAndGlassPlaceholder(
                currentAmountMl: currentAmountMl,
                goalAmountMl: goalAmountMl,
              ),
              const SizedBox(height: 12),
              ProgressLabel(percent: progressPercent),
              const SizedBox(height: 24),
              QuickAmountButtons(onAmountSelected: addWater),
              const SizedBox(height: 16),
              FreeAmountField(onSubmit: addWater),
            ],
          ),
        ),
      ),
    );
  }
}