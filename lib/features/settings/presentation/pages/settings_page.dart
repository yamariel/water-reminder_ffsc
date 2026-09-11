import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../providers/settings_provider.dart';
import '../widgets/daily_goal_card.dart';
import '../widgets/gender_selector.dart';
import '../widgets/time_setting_tile.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Profil & Paramètres',
                style: textTheme.headlineSmall?.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            DailyGoalCard(goal: settings.dailyGoal),
            const SizedBox(height: 18),
            Text('Genre', style: textTheme.titleMedium?.copyWith(fontSize: 15)),
            const SizedBox(height: 8),
            GenderSelector(
              selectedGender: settings.gender,
              onChanged: notifier.updateGender,
            ),
            const SizedBox(height: 16),
            Text(
              'Poids (kg)',
              style: textTheme.titleMedium?.copyWith(fontSize: 15),
            ),
            Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 4,
                      activeTrackColor: colors.primary,
                      inactiveTrackColor: AppTheme.sliderInactive,
                      thumbColor: colors.primary,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 10,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 16,
                      ),
                    ),
                    child: Slider(
                      value: settings.weight.clamp(30, 150),
                      min: 30,
                      max: 150,
                      divisions: 120,
                      activeColor: colors.primary,
                      onChanged: notifier.updateWeight,
                    ),
                  ),
                ),
                SizedBox(
                  width: 58,
                  child: Text(
                    '${settings.weight.round()} kg',
                    textAlign: TextAlign.end,
                    style: textTheme.titleMedium?.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Rythme quotidien',
              style: textTheme.titleMedium?.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 6),
            TimeSettingTile(
              icon: Icons.wb_sunny_outlined,
              iconColor: AppTheme.wakeUpOrange,
              label: 'Heure de réveil',
              time: settings.wakeUpTime,
              onTap: () async {
                final time = await _pickTime(context, settings.wakeUpTime);
                if (time != null) notifier.updateWakeUpTime(time);
              },
            ),
            const Divider(
              height: 1,
              thickness: 0.65,
              color: AppTheme.dividerGray,
            ),
            TimeSettingTile(
              icon: Icons.nightlight_outlined,
              iconColor: colors.primary,
              label: 'Heure de coucher',
              time: settings.bedTime,
              onTap: () async {
                final time = await _pickTime(context, settings.bedTime);
                if (time != null) notifier.updateBedTime(time);
              },
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rappels d’hydratation',
                        style: textTheme.titleMedium?.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Un rappel toutes les ${settings.reminderIntervalMinutes} minutes pendant l’éveil',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 0.72,
                  child: Switch(
                    value: settings.notificationsEnabled,
                    onChanged: notifier.toggleNotifications,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<TimeOfDay?> _pickTime(BuildContext context, TimeOfDay initialTime) {
  return showTimePicker(
    context: context,
    initialTime: initialTime,
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );
}
