import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water/features/hydration/presentation/providers/hydration_provider.dart';
import 'package:water/features/hydration/presentation/widgets/water_progress_widget.dart';
import 'package:water/features/hydration/presentation/widgets/hydration_header.dart';
import 'package:water/features/hydration/presentation/widgets/progress_label.dart';
import 'package:water/features/hydration/presentation/widgets/quick_amount_buttons.dart';
import 'package:water/features/hydration/presentation/widgets/free_amount_field.dart';

const int _mockGoalMl = 2000;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hydrationState = ref.watch(hydrationProvider);

    if (hydrationState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentAmountMl = hydrationState.todayTotalM1;
    const goalAmountMl = _mockGoalMl;
    final progressPercent = (currentAmountMl / goalAmountMl).clamp(0.0, 1.0);

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
              WaterProgressWidget(
                consumedValue: currentAmountMl,
                goalOfTheDay: goalAmountMl,
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
