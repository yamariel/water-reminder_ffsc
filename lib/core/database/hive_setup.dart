import 'package:hive_flutter/hive_flutter.dart';
import 'package:water/features/hydration/data/models/hydration_record.dart';

class HiveSetup {
  HiveSetup._();

  static const String hydrationBoxName = 'hydrationRecords';

  static Future<void> init() async {
    await Hive.initFlutter();

    _registerAdapters();
    await _openBoxes();
  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(DrinkTypeAdapter().typeId)) {
      Hive.registerAdapter(DrinkTypeAdapter()); 
    }

    if (!Hive.isAdapterRegistered(HydrationRecordAdapter().typeId)) {
      Hive.registerAdapter(HydrationRecordAdapter());
    }
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<HydrationRecord>(hydrationBoxName);
  }

  static Box<HydrationRecord> get hydrationBox =>
      Hive.box<HydrationRecord>(hydrationBoxName);
}