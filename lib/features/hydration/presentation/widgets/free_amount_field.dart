import 'package:flutter/material.dart';

class FreeAmountField extends StatefulWidget {
  final void Function(int amountMl) onSubmit;

  const FreeAmountField({super.key, required this.onSubmit});

  @override
  State<FreeAmountField> createState() => _FreeAmountFieldState();
}

class _FreeAmountFieldState extends State<FreeAmountField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = int.tryParse(_controller.text);
    if (value != null && value > 0) {
      widget.onSubmit(value);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Quantité libre (ex: 330)',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}