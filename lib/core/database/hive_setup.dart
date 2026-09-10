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
    if (!Hive.isAdapterRegistered(HydrationRecordAdapter().typeId)) {
      Hive.registerAdapter(HydrationRecordAdapter()); // fonction a definir
    }
    // on pourra definir les les futurs modeles ici
  }

  static Future<void> _openBoxes() async {
    await Hive.openBox<HydrationRecord>(hydrationBoxName);
    // ici aussi on pourra ajouter less autres boxes si necessaires
  }

  static Box<HydrationRecord> get hydrationBox =>
      Hive.box<HydrationRecord>(hydrationBoxName);
}
