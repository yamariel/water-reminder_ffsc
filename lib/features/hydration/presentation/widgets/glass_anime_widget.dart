import 'package:flutter/material.dart';
import 'package:water/core/theme/app_theme.dart';
import 'package:water_animation/water_animation.dart';

import 'glass_clipper.dart';
import 'glass_painter.dart';

/// Widget représentant le verre d'eau.
///
/// Responsabilités :
/// - afficher la quantité consommée ;
/// - calculer la progression ;
/// - afficher l'eau animée ;
/// - appliquer la forme du verre ;
/// - afficher le contour et les reflets.
///
/// L'animation du niveau d'eau est entièrement gérée
/// par le package `water_animation`.
class GlassAnimeWidget extends StatelessWidget {
  /// Objectif quotidien en millilitres.
  final int goalOfTheDay;

  /// Quantité d'eau actuellement consommée.
  final int consumedValue;

  const GlassAnimeWidget({
    super.key,
    required this.goalOfTheDay,
    required this.consumedValue,
  });

  /// Calcule le pourcentage de remplissage du verre.
  ///
  /// La valeur retournée est toujours comprise entre 0 et 1.
  double _calculateProgress() {
    // Évite une division par zéro.
    if (goalOfTheDay <= 0) {
      return 0.0;
    }

    return (
        consumedValue / goalOfTheDay
    ).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    // Progression actuelle du verre.
    final double progression = _calculateProgress();

    return Column(
      children: [

        Text(
          '$consumedValue ml',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),

        const SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipPath(
                    clipper: GlassClipper(),
                    child: WaterAnimation(
                      width: double.infinity,
                      height: double.infinity,
                      // 0.0 = verre vide
                      // 0.5 = 50 %
                      // 1.0 = verre plein
                      waterFillFraction: progression,
                      // Animation volontairement douce.
                      fillTransitionDuration:
                      const Duration(
                        milliseconds: 1400,
                      ),

                      fillTransitionCurve:
                      Curves.easeInOutCubic,
                      // Petite amplitude pour éviter
                      // un effet "océan".
                      amplitude: 7,
                      // Nombre de vagues.
                      frequency: 1.5,
                      // Vitesse de déplacement.
                      speed: 1.2,
                      waterColor:
                      AppTheme.waterBlue,

                      // Gradient vertical.
                      gradientColors: [
                        AppTheme.waterBlueLight,
                        AppTheme.waterBlue,
                        AppTheme.primaryBlue,
                      ],
                      // Désactivé pour avoir une animation
                      // plus calme.
                      enableRipple: false,

                      // Active le rendu avec shader.
                      enableShader: true,
                      enableSecondWave: true,

                      secondWaveColor:
                      AppTheme.waterBlueLight.withValues(
                        alpha: 0.30,
                      ),

                      secondWaveAmplitude: 4,

                      secondWaveFrequency: 1.5,

                      secondWaveSpeed: 0.8,
                      realisticWave: true,

                      // IMPORTANT :
                      // aucune bordure arrondie ici.
                      //
                      // C'est GlassClipper qui donne
                      // la véritable forme du verre.
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      painter: GlassPainter(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}