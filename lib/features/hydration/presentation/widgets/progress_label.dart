import 'package:flutter/material.dart';

class ProgressLabel extends StatelessWidget {
  final double percent;

  const ProgressLabel({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${percent.toStringAsFixed(0)}%', style: Theme.of(context).textTheme.headlineSmall),
        Text('Progression', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}