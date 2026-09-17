import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/date_formatter.dart';
import '../providers/hydration_provider.dart';
import '../widgets/empty_water_history.dart';
import '../widgets/water_history_item.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hydrationState = ref.watch(hydrationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Historique d'hydratation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: hydrationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : hydrationState.history.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: EmptyWaterHistory(),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: hydrationState.history.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final record = hydrationState.history[index];

                return WaterHistoryItem(
                  // ASTUCE : On utilise ton utilitaire au lieu du toString() brut !
                  time: DateFormatter.formatTime(record.date.toLocal()),
                  amount: record.amountMl,
                  onDelete: () {
                    ref.read(hydrationProvider.notifier).deleteRecord(index);
                  },
                );
              },
            ),
    );
  }
}
