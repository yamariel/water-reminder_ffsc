import '../models/user_settings.dart';

abstract class SettingsRepository {
  Future<UserSettings> loadSetting();
  Future<void> saveSetting(UserSettings settings);
}