import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

import 'package:water/core/notifications/notification_service.dart';
import 'package:water/features/settings/domain/models/user_settings.dart';
import 'package:water/features/settings/enums/gender_enum.dart';

class MockFlutterLocalNotificationsPlugin extends Mock
    implements FlutterLocalNotificationsPlugin {}

class MockRescheduleWaterReminders extends Mock
    implements FlutterLocalNotificationsPlugin {}

class FakeTZDateTime extends Fake implements tz.TZDateTime {}

class FakeNotificationDetails extends Fake implements NotificationDetails {}

void main() {
  late NotificationService notificationService;
  late MockFlutterLocalNotificationsPlugin mockPlugin;
  late UserSettings settings;
  late int reminderIntervalMinutes;

  setUpAll(() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("UTC"));
    registerFallbackValue(FakeTZDateTime());
    registerFallbackValue(FakeNotificationDetails());

    registerFallbackValue(AndroidScheduleMode.inexactAllowWhileIdle);
    registerFallbackValue(DateTimeComponents.time);
  });

  setUp(() {
    mockPlugin = MockFlutterLocalNotificationsPlugin();
    notificationService = NotificationService(plugin: mockPlugin);
    settings = UserSettings(
      gender: Gender.male,
      weight: 30,
      wakeUpTime: const TimeOfDay(hour: 7, minute: 0),
      bedTime: const TimeOfDay(hour: 23, minute: 0),
      notificationsEnabled: true,
    );
    reminderIntervalMinutes = settings.reminderIntervalMinutes;
  });

  test(
    "cancelAllReminders doit appeler la méthode cancelAll du plugin natif",
    () async {
      when(() => mockPlugin.cancelAll()).thenAnswer((_) async {});

      await notificationService.cancelAllReminders();

      verify(() => mockPlugin.cancelAll()).called(1);
    },
  );

  test("Vérifier que rescheduleWaterReminders programme exactement le bon nombre de rappels", () async {
    when(() => mockPlugin.cancelAll()).thenAnswer((_) async {});
    when(
      () => mockPlugin.zonedSchedule(
        id: any(named: "id"),
        title: any(named: "title"),
        body: any(named: "body"),
        scheduledDate: any(named: "scheduledDate"),
        notificationDetails: any(named: "notificationDetails"),
        androidScheduleMode: any(named: "androidScheduleMode"),
        matchDateTimeComponents: any(named: "matchDateTimeComponents"),
      ),
    ).thenAnswer((_) async {});

    await notificationService.rescheduleWaterReminders(settings);

    int expectedCalls = 960 ~/ reminderIntervalMinutes;
    if (960 % reminderIntervalMinutes == 0) {
      expectedCalls -= 1;
    }

    verify(
      () => mockPlugin.zonedSchedule(
        id: any(named: "id"),
        title: any(named: "title"),
        body: any(named: "body"),
        scheduledDate: any(named: "scheduledDate"),
        notificationDetails: any(named: "notificationDetails"),
        androidScheduleMode: any(named: "androidScheduleMode"),
        matchDateTimeComponents: any(named: "matchDateTimeComponents"),
      ),
    ).called(expectedCalls);
  });
}
