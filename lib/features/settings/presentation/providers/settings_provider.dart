import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../domain/models/user_settings.dart';
import '../../enums/gender_enum.dart';

class UserSettingsNotifier extends Notifier<UserSettings> {
  @override
  //Valeur initiale
  UserSettings build() {
    return const UserSettings(
      gender: Gender.female,
      weight: 70,
      wakeUpTime: TimeOfDay(hour: 7, minute: 0),
      bedTime: TimeOfDay(hour: 22, minute: 0),
      notificationsEnabled: true,
    );
  }

  //Mettre à jour le genre
  void updateGender(Gender newGender) {
    state = state.copyWith(gender: newGender);
  }

  //Mettre à jour le poids
  void updateWeight(double newWeight) {
    state = state.copyWith(weight: newWeight);
  }

  //Mettre à jour l'heure de réveil
  void updateWakeUpTime(TimeOfDay newTime) {
    state = state.copyWith(wakeUpTime: newTime);
  }

  //Mettre à jour du couché
  void updateBedTime(TimeOfDay newTime) {
    state = state.copyWith(wakeUpTime: newTime);
  }

  //Mettre à jour l'état des notifications
  void toggleNotifications(bool enabled) {
    state = state.copyWith(notificationsEnabled: enabled);
  }
}

final settingNotifierProvider = NotifierProvider<UserSettingsNotifier, UserSettings>(UserSettingsNotifier.new);