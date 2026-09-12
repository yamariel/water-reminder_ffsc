import 'package:flutter/material.dart';

/// Dessine le contour et les effets visuels
/// permettant de donner au verre un aspect
/// transparent et légèrement réaliste.
class GlassPainter extends CustomPainter {
  final Color color;

  const GlassPainter({
    required this.color,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    // ==================================================
    // DIMENSIONS DU VERRE
    // ==================================================

    final double left = size.width * 0.05;
    final double right = size.width * 0.95;

    final double top = 10;
    final double bottom = size.height - 15;

    // ==================================================
    // FORME DU VERRE
    // ==================================================

    final Path glassPath = Path()
    // Coin supérieur gauche
      ..moveTo(left, top)

    // Bord supérieur
      ..lineTo(right, top)

    // Côté droit légèrement incliné
      ..lineTo(
        right - 25,
        bottom - 20,
      )

    // Arrondi inférieur droit
      ..quadraticBezierTo(
        right - 30,
        bottom,
        right - 55,
        bottom,
      )

    // Bas
      ..lineTo(
        left + 55,
        bottom,
      )

    // Arrondi inférieur gauche
      ..quadraticBezierTo(
        left + 30,
        bottom,
        left + 25,
        bottom - 20,
      )

    // Retour vers le haut
      ..close();

    // ==================================================
    // CONTOUR DU VERRE
    // ==================================================

    final Paint borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = color.withValues(alpha: 0.75);

    canvas.drawPath(
      glassPath,
      borderPaint,
    );

    // ==================================================
    // BORD SUPÉRIEUR
    // ==================================================

    // Le bord supérieur doit être légèrement
    // plus visible que les autres côtés.
    final Paint rimPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = color.withValues(alpha: 0.9);

    canvas.drawLine(
      Offset(left, top),
      Offset(right, top),
      rimPaint,
    );

    // ==================================================
    // REFLET PRINCIPAL
    // ==================================================

    // Ce reflet blanc permet de donner l'impression
    // que la lumière se réfléchit sur le verre.
    final Paint reflectionPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.55);

    final Path reflectionPath = Path()
      ..moveTo(
        left + 20,
        top + 25,
      )
      ..quadraticBezierTo(
        left + 20,
        size.height * 0.45,
        left + 28,
        size.height * 0.75,
      );

    canvas.drawPath(
      reflectionPath,
      reflectionPaint,
    );

    // ==================================================
    // PETIT REFLET À DROITE
    // ==================================================

    final Paint smallReflectionPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withValues(alpha: 0.30);

    canvas.drawLine(
      Offset(
        right - 18,
        top + 30,
      ),
      Offset(
        right - 25,
        size.height * 0.55,
      ),
      smallReflectionPaint,
    );
  }

  @override
  bool shouldRepaint(
      covariant GlassPainter oldDelegate,
      ) {
    return oldDelegate.color != color;
  }
}