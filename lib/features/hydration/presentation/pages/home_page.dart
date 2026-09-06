import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WaterReminder')),
     body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
  const Text('2550ml'),
  const Text('1300ml'),
  const SizedBox(height: 20),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(onPressed: () {}, child: const Text('150ml')),
      const SizedBox(width: 10),
      ElevatedButton(onPressed: () {}, child: const Text('250ml')),
      const SizedBox(width: 10),
      ElevatedButton(onPressed: () {}, child: const Text('500ml')),
    ],
  ),
],
  ),
),
    );
  }
}
