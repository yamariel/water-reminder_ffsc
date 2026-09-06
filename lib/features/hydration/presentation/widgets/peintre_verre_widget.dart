import 'package:flutter/cupertino.dart';

class PeintreVerreWidget extends CustomPainter{
  final double progression;

  const PeintreVerreWidget({required this.progression});


  @override
  void paint(Canvas canvas, Size size) {
    final double left = size.width * 0.15;
    final double right = size.width * 0.85;
    final double top = 10;
    final double bottom = size.height - 20;

    /// VERRE
    final glassPath = Path()
      ..moveTo(left, top)
      ..lineTo(right, top)
      ..lineTo(right - 20, bottom)
      ..lineTo(left + 20, bottom)
      ..close();

    final glassPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..color = const Color(0xFF1748B0);//Bleu fonce:changer avec le theme

    canvas.drawPath(
      glassPath,
      glassPaint,
    );
    /// EAU
    final waterTop =
        bottom - ((bottom - top) * progression);

    final waterPath = Path()
      ..moveTo(left + 20, bottom - 4)
      ..lineTo(right - 20, bottom - 4)
      ..lineTo(
        right - 20,
        waterTop,
      )
      ..lineTo(
        left + 20,
        waterTop,
      )
      ..close();

    final waterPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF69A8F7);//bleu clair

    canvas.drawPath(
      waterPath,
      waterPaint,
    );
  }

  @override
  bool shouldRepaint(
      covariant PeintreVerreWidget oldDelegate,
      ) {
    return oldDelegate.progression != progression;
  }

}