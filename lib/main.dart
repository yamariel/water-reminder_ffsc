import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
