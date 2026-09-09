import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/core/theme/app_theme.dart';
import 'package:water_animation/water_animation.dart';

/**
 * Ce widget gerera lanimation du verre
 */
class VerreAnime extends StatefulWidget {
  final int objectifJournalier;
  final int valuerConsommee;

  VerreAnime({required this.objectifJournalier, required this.valuerConsommee});

  @override
  State<StatefulWidget> createState() => _VerreAnimeState();
}

/**
 * Un Ticker agit comme le battement de cœur d'une animation :
 * il déclenche un signal à chaque rafraîchissement d'écran de l'appareil (généralement 60 ou 120 fois par seconde)
 * en transmettant le temps écoulé, ce qui permet de calculer le rendu image par image
 * .
 */
class _VerreAnimeState extends State<VerreAnime>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  /// Progression actuellement affichée par l'animation.
  late double _ancienneProgression =
      (widget.valuerConsommee / widget.objectifJournalier).clamp(0.0, 1.0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
      animationBehavior: AnimationBehavior.normal
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.valuerConsommee / widget.objectifJournalier,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  /// Calcule la progression entre 0 et 1.
  double _calculerProgression() {
    if (widget.objectifJournalier <= 0) {
      return 0.0;
    }

    return (widget.valuerConsommee / widget.objectifJournalier).clamp(0.0, 1.0);
  }

  /// Appelé lorsque les paramètres du widget changent.
  @override
  void didUpdateWidget(covariant VerreAnime oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.valuerConsommee != widget.valuerConsommee ||
        oldWidget.objectifJournalier != widget.objectifJournalier) {
      final double nouvelleProgression = _calculerProgression();

      _animation = Tween<double>(
        begin: _ancienneProgression,
        end: nouvelleProgression,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

      _ancienneProgression = nouvelleProgression;

      /// On recommence l'animation.
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          '${widget.valuerConsommee} ml',
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer

          ),
        ),

        // AnimatedBuilder(
        //   animation: _animation,
        //   builder: (context, child) {
        //     return SizedBox(
        //       width: double.maxFinite,
        //       height: 300,
        //
        //       child: CustomPaint(
        //         painter: PeintreVerreWidget(progression: _animation.value),
        //       ),
        //     );
        //   },
        // ),

        Expanded(
        child: Padding(padding:const EdgeInsets.only(right: 10),
        child: WaterAnimation(
          width: double.maxFinite,
          height: double.infinity,

          // Niveau d'eau
          waterFillFraction: _ancienneProgression,

          // Animation du remplissage
          fillTransitionDuration:
          const Duration(milliseconds: 1400),
          fillTransitionCurve: Curves.easeInOutCubic,


          // Vagues
          amplitude: 7,
          frequency: 1.5,
          speed: 1.5,

          // Couleur provenant du thème
          // waterColor: AppTheme.waterBlueLight,

          // Gradient-Utiliser le theme
          // gradientColors: [
          //   AppTheme.waterBlueLight,
          //   AppTheme.waterBlueLight,
          //   AppTheme.waterBlueLight,
          // ],

          enableRipple: true,
          enableShader: true,

          // Une deuxième vague
          // enableSecondWave: true,
          // secondWaveColor:AppTheme.waterBlueLight,
          secondWaveAmplitude: 5,
          secondWaveFrequency: 1.5,
          secondWaveSpeed: 1,

          // Vagues plus naturelles
          realisticWave: true,

          // Conteneur
          decoration: BoxDecoration(
            // color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              // color: theme.colorScheme.primary,
              width: 5,
            ),
          ),
        ),
            ) ),
      ],
    );
  }
}
