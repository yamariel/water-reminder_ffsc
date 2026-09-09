import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/core/theme/app_theme.dart';
import 'package:water/features/hydration/presentation/widgets/peintre_verre_widget.dart';

class VerreWidget extends StatelessWidget {
  final double progression;
  final int valuerConsommee;

  const VerreWidget({required this.progression, required this.valuerConsommee});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PeintreVerreWidget(progression: progression),
      child: SizedBox(
          height: 360,
          width: 300,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Text(
                '${valuerConsommee}ml',
                style: const TextStyle(
                  color:AppTheme.waterBlueLight,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            )
          )
      ),
    );
  }
}
