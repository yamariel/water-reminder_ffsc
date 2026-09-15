import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../features/settings/domain/models/user_settings.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  //initialisation des notifications
  Future<void> init() async {
    tz.initializeTimeZones();
    final TimezoneInfo timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName.identifier));

    if (_isInitialized) return;

    //préparer l'init du param android/iOS
    const initSettingsAndroid = AndroidInitializationSettings(
      'ic_goutte_silhouette',
    );
    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    //init des params
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );
    await notificationsPlugin.initialize(settings: initSettings);
    _isInitialized = true;
  }

  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    await notificationsPlugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails: notificationDetails(),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  //demander la permission d'envoyer des notifs
  Future<void> requestPermissions() async {
    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  //détails des notifications
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily notifications',
        channelDescription: 'Daily Notification',
        importance: Importance.max,
        priority: Priority.high,
        largeIcon: DrawableResourceAndroidBitmap('goutte'),
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  //annule toutes les notifications programmées
  Future<void> cancelAllReminders() async {
    await notificationsPlugin.cancelAll();
  }

  //recalcule et programme les rappels en fonction des params
  Future<void> rescheduleWaterReminders(UserSettings settings) async {
    await cancelAllReminders();

    //arrêté le programme si les notifs sont désactiver
    if (!settings.notificationsEnabled) return;

    final now = DateTime.now();

    //convertit les TimeOfDay en DateTime pour aujourd'hui
    DateTime wakeUp = DateTime(
      now.year,
      now.month,
      now.day,
      settings.wakeUpTime.hour,
      settings.wakeUpTime.minute,
    );
    DateTime bed = DateTime(
      now.year,
      now.month,
      now.day,
      settings.bedTime.hour,
      settings.bedTime.minute,
    );
    //si l'utilisateur se couche après minuit
    if (bed.isBefore(wakeUp)) {
      bed = bed.add(const Duration(days: 1));
    }

    int notificationId = 0;
    DateTime reminderTime = wakeUp.add(
      Duration(minutes: settings.reminderIntervalMinutes)
    );

    while (reminderTime.isBefore(bed)) {
      await notificationsPlugin.zonedSchedule(
        id: notificationId,
        title: "C'est l'heure de boire !",
        body: "Un petit verre d'eau pour atteindre votre objectif.",
        scheduledDate: tz.TZDateTime.from(reminderTime, tz.local), 
        notificationDetails: notificationDetails(),
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      reminderTime = reminderTime.add(
        Duration(minutes: settings.reminderIntervalMinutes)
      );
      notificationId++;
    }
  }

  //affichage de la notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsPlugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: notificationDetails(),
    );
  }
}
