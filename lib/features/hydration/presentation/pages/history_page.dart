import 'package:flutter/material.dart';

class HistoryPagePage extends StatelessWidget {
  const HistoryPagePage({super.key});

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