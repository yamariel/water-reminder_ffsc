import 'package:flutter/material.dart';

import '../widgets/empty_water_history.dart';
import '../widgets/water_history_item.dart';

/// Modèle simple pour une entrée d'historique mock.
/// TODO: remplacer par HydrationRecord une fois hydrationProvider corrigé.
class _MockEntry {
  final String time;
  final int amountMl;

  _MockEntry({required this.time, required this.amountMl});
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // ---- DONNÉES MOCK (temporaires) ----
  // À remplacer par : final entries = ref.watch(hydrationProvider).history;
  final List<_MockEntry> _entries = [
    _MockEntry(time: '08:15', amountMl: 250),
    _MockEntry(time: '10:42', amountMl: 150),
    _MockEntry(time: '13:05', amountMl: 500),
    _MockEntry(time: '16:30', amountMl: 200),
  ];

  void _deleteEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
    // Plus tard : ref.read(hydrationProvider.notifier).deleteRecord(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique')),
      body: SafeArea(
        child: _entries.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(16),
                child: EmptyWaterHistory(),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: _entries.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return WaterHistoryItem(
                    time: entry.time,
                    amount: entry.amountMl,
                    onDelete: () => _deleteEntry(index),
                  );
                },
              ),
      ),
    );
  }
}