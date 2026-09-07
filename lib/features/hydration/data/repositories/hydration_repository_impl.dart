import 'package:hive/hive.dart';
import 'package:water/core/database/hive_setup.dart' show HiveSetup;
import 'package:water/features/hydration/data/models/hydration_record.dart';
import 'package:water/features/hydration/domain/repositories/hydration_repository.dart';

class HydrationRepoImpl implements HydrationRepository {
  Box<HydrationRecord> get _box => HiveSetup.hydrationBox;

  @override
  Future<void> addWater(int amount) async {
    final record = HydrationRecord(
      date: DateTime.now(),
      amountM1: amount,
      type: DrinkType.water,
    );
    await _box.add(record);
  }

  @override
  Future<int> getTodayWater() async {
    final today = DateTime.now();
    return _box.values
        .where((record) => _isSameDay(record.date, today))
        .fold<int>(0, (sum, record) => sum + record.amountM1);
  }

  @override
  Future<void> clearTodayWater() async {
    final today = DateTime.now();
    final keysToDelete = _box.keys.where((key) {
      final record = _box.get(key);
      return record != null && _isSameDay(record.date, today);
    }).toList();
    await _box.deleteAll(keysToDelete);
  }

  @override
  Future<List<HydrationRecord>> getHistory() async {
    return _box.values.toList();
  }

  @override
  Future<void> deleteRecord(int index) async {
    await _box.deleteAt(index);
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
