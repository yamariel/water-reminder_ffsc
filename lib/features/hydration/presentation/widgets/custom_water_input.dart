import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:water/core/theme/app_theme.dart';
import 'package:water/features/hydration/presentation/providers/hydration_provider.dart';

class CustomWaterInput extends ConsumerStatefulWidget {
  const CustomWaterInput({super.key});

  @override
  ConsumerState<CustomWaterInput> createState() => _CustomWaterInputState();
}

class _CustomWaterInputState extends ConsumerState<CustomWaterInput> {
  final TextEditingController _controller = TextEditingController();

  void _submitWater() {
    final amount = int.tryParse(_controller.text);
    if (amount != null && amount > 0) {
      ref.read(hydrationProvider.notifier).addWater(amount);
      _controller.clear();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.backgroundBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: AppTheme.primaryText),
          decoration: InputDecoration(
            hintText: 'Quantité libre (ex: 330)',
            hintStyle: const TextStyle(color: AppTheme.mutedText, fontSize: 14),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.check_circle,
                color: AppTheme.primaryBlue,
                size: 28,
              ),
              onPressed: _submitWater,
            ),
          ),
          onSubmitted: (_) => _submitWater(),
        ),
      ),
    );
  }
}
