import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider temporaire pour l'objectif quotidien.
/// TODO: remplacer par la valeur calculée dans settingsProvider

class DailyGoalNotifier extends Notifier<int> {
  @override
  int build() => 2550;

  void updateGoal(int newGoal) {
    state = newGoal;
  }
}

final dailyGoalProvider = NotifierProvider<DailyGoalNotifier, int>(() {
  return DailyGoalNotifier();
});