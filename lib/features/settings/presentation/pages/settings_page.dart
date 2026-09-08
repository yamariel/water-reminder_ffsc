import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/gender_enum.dart';
import '../providers/settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingNotifierProvider);
    final notifier = ref.read(settingNotifierProvider.notifier);
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Profil & Paramètres',
                style: textTheme.headlineSmall?.copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(height: 12),
            _DailyGoalCard(goal: settings.dailyGoal),
            const SizedBox(height: 14),
            Text('Genre', style: textTheme.titleMedium?.copyWith(fontSize: 15)),
            const SizedBox(height: 6),
            _GenderSelector(
              selectedGender: settings.gender,
              onChanged: notifier.updateGender,
            ),
            const SizedBox(height: 14),
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
            const SizedBox(height: 12),
            Text(
              'Rythme quotidien',
              style: textTheme.titleMedium?.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 2),
            _TimeSettingTile(
              icon: Icons.wb_sunny_outlined,
              iconColor: colors.secondary,
              label: 'Heure de réveil',
              time: settings.wakeUpTime,
              onTap: () async {
                final time = await _pickTime(context, settings.wakeUpTime);
                if (time != null) notifier.updateWakeUpTime(time);
              },
            ),
            const Divider(height: 1),
            _TimeSettingTile(
              icon: Icons.nightlight_outlined,
              iconColor: colors.primary,
              label: 'Heure de coucher',
              time: settings.bedTime,
              onTap: () async {
                final time = await _pickTime(context, settings.bedTime);
                if (time != null) notifier.updateBedTime(time);
              },
            ),
            const SizedBox(height: 12),
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
                      const SizedBox(height: 2),
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

class _DailyGoalCard extends StatelessWidget {
  const _DailyGoalCard({required this.goal});

  final int goal;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colors.primary,
            Color.lerp(colors.primary, colors.onPrimary, 0.35)!,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            children: [
              Text(
                'Objectif quotidien recommandé',
                style: TextStyle(
                  color: colors.onPrimary.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$goal ml',
                style: TextStyle(
                  color: colors.onPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Calculé selon votre poids et votre rythme d’éveil',
                style: TextStyle(
                  color: colors.onPrimary.withValues(alpha: 0.7),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenderSelector extends StatelessWidget {
  const _GenderSelector({
    required this.selectedGender,
    required this.onChanged,
  });

  final Gender selectedGender;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(20);

    return Container(
      height: 32,
      decoration: BoxDecoration(borderRadius: borderRadius),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: colors.outline),
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: _GenderOption(
              gender: Gender.male,
              label: 'Homme',
              selected: selectedGender == Gender.male,
              onTap: () => onChanged(Gender.male),
            ),
          ),
          Container(width: 1, color: colors.outline),
          Expanded(
            child: _GenderOption(
              gender: Gender.female,
              label: 'Femme',
              selected: selectedGender == Gender.female,
              onTap: () => onChanged(Gender.female),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.gender,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Gender gender;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      height: double.infinity,
      color: selected ? colors.primaryContainer : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected
                    ? Icons.check
                    : gender == Gender.male
                    ? Icons.male
                    : Icons.female,
                size: 16,
                color: selected ? colors.primary : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  color: selected ? colors.primary : colors.onSurfaceVariant,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeSettingTile extends StatelessWidget {
  const _TimeSettingTile({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.time,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 23),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge
                    ?.copyWith(fontSize: 14),
              ),
            ),
            Text(
              time.format(context),
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

Future<TimeOfDay?> _pickTime(BuildContext context, TimeOfDay initialTime) {
  return showTimePicker(context: context, initialTime: initialTime);
}
