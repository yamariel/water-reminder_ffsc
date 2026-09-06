import 'package:flutter/material.dart';
import 'package:water/features/hydration/presentation/widgets/water_progress_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WaterReminder')),
      body: const WaterProgressWidget(valuerConsommee: 200, objectifJournalier: 500),
    );
  }
}
