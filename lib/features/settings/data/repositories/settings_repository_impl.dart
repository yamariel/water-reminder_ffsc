import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/user_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../enums/gender_enum.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences prefs;
  SettingsRepositoryImpl(this.prefs);
  static const String keyGender = "key_gender";
  static const String keyWeight = "key_weight";
  static const String keyWakeHour = "key_wake_hour";
  static const String keyWakeMinute = "key_wake_minute";
  static const String keyBedHour = "key_bed_hour";
  static const String keyBedMinute = "key_bed_minute";
  static const String keyNotifications = "key_notifications";
  @override
  //Vérifie s'il y'a des préferences et les charge sinon renvoie l'utilisateur par défaut
  Future<UserSettings> loadSetting() async {
    final genderStr = prefs.getString(keyGender);
    final gender = (genderStr == Gender.male.name)
        ? Gender.male
        : Gender.female;

    final weight = prefs.getDouble(keyWeight) ?? 70.0;

    final wakeHour = prefs.getInt(keyWakeHour) ?? 7;
    final wakeMinute = prefs.getInt(keyWakeMinute) ?? 0;
    final wakeUpTime = TimeOfDay(hour: wakeHour, minute: wakeMinute);

    final bedHour = prefs.getInt(keyBedHour) ?? 22;
    final bedMinute = prefs.getInt(keyBedMinute) ?? 0;
    final bedTime = TimeOfDay(hour: bedHour, minute: bedMinute);

    final notificationsEnabled = prefs.getBool(keyNotifications) ?? true;

    return UserSettings(
      gender: gender,
      weight: weight,
      wakeUpTime: wakeUpTime,
      bedTime: bedTime,
      notificationsEnabled: notificationsEnabled,
    );
  }

  @override
  //Sauvegarde les préferences de l'utilisateur en local
  Future<void> saveSetting(UserSettings settings) async {
    await Future.wait([
      prefs.setString(keyGender, settings.gender.name),
      prefs.setDouble(keyWeight, settings.weight),
      prefs.setInt(keyWakeHour, settings.wakeUpTime.hour),
      prefs.setInt(keyWakeMinute, settings.wakeUpTime.minute),
      prefs.setInt(keyBedHour, settings.bedTime.hour),
      prefs.setInt(keyBedMinute, settings.bedTime.minute),
      prefs.setBool(keyNotifications, settings.notificationsEnabled),
    ]);
  }
}
