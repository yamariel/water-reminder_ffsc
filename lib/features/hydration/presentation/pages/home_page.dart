import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water/features/settings/presentation/providers/settings_provider.dart';
import 'package:water/features/hydration/presentation/providers/hydration_provider.dart';

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

            const SizedBox(height: 40),

            const QuickActionButtons(),

            const SizedBox(height: 20),

            const CustomWaterInput(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
