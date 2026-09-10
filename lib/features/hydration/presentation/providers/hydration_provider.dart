import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water/features/hydration/data/models/hydration_record.dart';
import 'package:water/features/hydration/data/repositories/hydration_repository_impl.dart';
import 'package:water/features/hydration/domain/repositories/hydration_repository.dart';

final hydrationRepositoryProvider = Provider<HydrationRepository>((ref) {
  return HydrationRepoImpl();
});

class HydrationState {
  final int todayTotalM1;
  final List<HydrationRecord> history;
  final bool isLoading;

  const HydrationState({
    required this.todayTotalM1,
    required this.history,
    this.isLoading = false,
  });

  factory HydrationState.initial() =>
      const HydrationState(todayTotalM1: 0, history: [], isLoading: true);

  HydrationState copyWith({
    int? todayTotalMl,
    List<HydrationRecord>? history,
    bool? isLoading,
  }) {
    return HydrationState(
      todayTotalM1: todayTotalMl ?? todayTotalM1,
      history: history ?? this.history,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HydrationNotifier extends Notifier<HydrationState> {
  late final HydrationRepository _repository;

  @override
  HydrationState build() {
    _repository = ref.read(hydrationRepositoryProvider);
    _loadData();
    return HydrationState.initial();
  }

  Future<void> _loadData() async {
    state = state.copyWith(isLoading: true);
    final total = await _repository.getTodayWater();
    final history = await _repository.getHistory();
    state = state.copyWith(
      todayTotalMl: total,
      history: history,
      isLoading: false,
    );
  }

  Future<void> addWater(int amountM1) async {
    await _repository.addWater(amountM1);
    await _loadData();
  }

  Future<void> clearToday() async {
    await _repository.clearTodayWater();
    await _loadData();
  }

  Future<void> deleRecord(int index) async {
    await _repository.addWater(index);
    await _loadData();
  }
}

final hydrationProvider = NotifierProvider<HydrationNotifier, HydrationState>(
  () {
    return HydrationNotifier();
  },
);
