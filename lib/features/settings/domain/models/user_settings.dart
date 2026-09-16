import 'package:flutter/material.dart';

import '../../enums/gender_enum.dart';

class UserSettings {
  final Gender gender;
  final double weight;
  final TimeOfDay wakeUpTime;
  final TimeOfDay bedTime;
  final bool notificationsEnabled;

  const UserSettings({
    required this.gender,
    required this.weight,
    required this.wakeUpTime,
    required this.bedTime,
    required this.notificationsEnabled,
  });

  // Permet de modifier un ou plusieurs champs sans réécrire tout l'objet
  UserSettings copyWith({
    Gender? gender,
    double? weight,
    TimeOfDay? wakeUpTime,
    TimeOfDay? bedTime,
    bool? notificationsEnabled,
  }) {
    return UserSettings(
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      wakeUpTime: wakeUpTime ?? this.wakeUpTime,
      bedTime: bedTime ?? this.bedTime,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  // Calcule la durée d'éveil en heures en gérant le cas où le coucher dépasse minuit
  double get awakeHours {
    int wakeMinutes = wakeUpTime.hour * 60 + wakeUpTime.minute;
    int bedMinutes = bedTime.hour * 60 + bedTime.minute;
    int totalMinutes;

    if (bedMinutes < wakeMinutes) {
      totalMinutes = (24 * 60 + bedMinutes) - wakeMinutes;
    } else {
      totalMinutes = bedMinutes - wakeMinutes;
    }
    return totalMinutes / 60;
  }

  // Calcule l'objectif en ml selon le poids, le genre et un bonus si la journée dépasse 14h
  int get dailyGoal {
    double totalGoal;

    if (gender == Gender.male) {
      totalGoal = weight * 35;
    } else {
      totalGoal = weight * 31;
    }

    if (awakeHours > 14) {
      totalGoal += (awakeHours - 14) * 50;
    }
    return totalGoal.round();
  }

  // Intervalle de rappel fixé à 5 minutes pour faciliter les tests et la démonstration
  int get reminderIntervalMinutes => 5;
}