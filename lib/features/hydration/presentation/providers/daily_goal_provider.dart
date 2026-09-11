import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider temporaire pour l'objectif quotidien.
/// TODO: remplacer par la valeur calculée dans settingsProvider

final dailyGoalProvider = StateProvider<int>((ref) => 2550);