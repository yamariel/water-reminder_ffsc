import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/models/user_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../enums/gender_enum.dart';

//Fournit une instance de SharedPreferences
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

//Ecoute les prefs et appel SettingsRepositoryImpl pour l'implémentation
final settingsRepositoryProvider = FutureProvider<SettingsRepository>((
  ref,
) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return SettingsRepositoryImpl(prefs);
});

class UserSettingsNotifier extends Notifier<UserSettings> {
  @override
  UserSettings build() {
    //le chargement des données sauvegardées
    _initStorage();
    //Valeur initiale au lancement de l'appli
    return const UserSettings(
      gender: Gender.female,
      weight: 70,
      wakeUpTime: TimeOfDay(hour: 7, minute: 0),
      bedTime: TimeOfDay(hour: 22, minute: 0),
      notificationsEnabled: true,
    );
  }

  //récupérer les prefs sauvegarder
  Future<void> _initStorage() async {
    final repo = await ref.read(settingsRepositoryProvider.future);
    final savedSettings = await repo.loadSetting();
    state = savedSettings;
  }

  //mettre à jour la nouvelle pref et la save avec la méthode saveSetting
  Future<void> _updateAndSave(UserSettings newSettings) async {
    state = newSettings;
    final repo = await ref.read(settingsRepositoryProvider.future);
    await repo.saveSetting(state);
  }

  //Mettre à jour le genre
  void updateGender(Gender newGender) {
    _updateAndSave(state.copyWith(gender: newGender));
  }

  //Mettre à jour le poids
  void updateWeight(double newWeight) {
    _updateAndSave(state.copyWith(weight: newWeight));
  }

  //Mettre à jour l'heure de réveil
  void updateWakeUpTime(TimeOfDay newTime) {
    _updateAndSave(state.copyWith(wakeUpTime: newTime));
  }

  //Mettre à jour du couché
  void updateBedTime(TimeOfDay newTime) {
    _updateAndSave(state.copyWith(bedTime: newTime));
  }

  //Mettre à jour l'état des notifications
  void toggleNotifications(bool enabled) {
    _updateAndSave(state.copyWith(notificationsEnabled: enabled));
  }
}

final settingsNotifierProvider =
    NotifierProvider<UserSettingsNotifier, UserSettings>(
      UserSettingsNotifier.new,
    );
