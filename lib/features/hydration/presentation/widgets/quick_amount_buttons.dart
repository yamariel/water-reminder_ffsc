import 'package:flutter/material.dart';

class QuickAmountButtons extends StatelessWidget {
  final List<int> amounts;
  final void Function(int amountMl) onAmountSelected;

  const QuickAmountButtons({
    super.key,
    this.amounts = const [150, 250, 500],
    required this.onAmountSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: amounts.map((amount) {
        return ElevatedButton(
          onPressed: () => onAmountSelected(amount),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text('$amount ml'),
        );
      }).toList(),
    );
  }
}