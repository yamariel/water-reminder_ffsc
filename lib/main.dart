import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/database/hive_setup.dart';
import 'core/notifications/notification_service.dart';
import 'core/presentation/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveSetup.init();
  await NotificationService.init();

  runApp(const ProviderScope(child: WaterReminderApp()));
}

class WaterReminderApp extends StatelessWidget {
  const WaterReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WaterReminder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const MainScreen(),
    );
  }
}
