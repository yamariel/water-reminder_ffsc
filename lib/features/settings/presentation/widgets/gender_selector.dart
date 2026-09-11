import 'package:flutter/material.dart';

import '../../enums/gender_enum.dart';
import 'gender_option.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  final Gender selectedGender;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.circular(20);

    return Container(
      height: 32,
      decoration: BoxDecoration(borderRadius: borderRadius),
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: colors.outline),
        borderRadius: borderRadius,
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
            child: GenderOption(
              gender: Gender.male,
              label: 'Homme',
              selected: selectedGender == Gender.male,
              onTap: () => onChanged(Gender.male),
            ),
          ),
          Container(width: 1, color: colors.outline),
          Expanded(
            child: GenderOption(
              gender: Gender.female,
              label: 'Femme',
              selected: selectedGender == Gender.female,
              onTap: () => onChanged(Gender.female),
            ),
          ),
        ],
      ),
    );
  }
}
