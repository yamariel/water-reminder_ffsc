import 'package:flutter/cupertino.dart';

class GlassClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final left = size.width * 0.05;
    final right = size.width * 0.95;

    final top = 10.0;
    final bottom = size.height - 15;

    final path = Path();

    path.moveTo(left, top);

    // Bord supérieur
    path.lineTo(right, top);

    // Côté droit légèrement incliné
    path.lineTo(right - 25, bottom - 20);

    // Bas arrondi
    path.quadraticBezierTo(
      right - 30,
      bottom,
      right - 55,
      bottom,
    );

    path.lineTo(left + 55, bottom);

    path.quadraticBezierTo(
      left + 30,
      bottom,
      left + 25,
      bottom - 20,
    );

    // Côté gauche
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant GlassClipper oldClipper) {
    return false;
  }
}