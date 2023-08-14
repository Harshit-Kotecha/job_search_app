import 'package:flutter/material.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'dart:math' as math;

class SemiCircle extends StatelessWidget {
  const SemiCircle({
    super.key,
    this.diameter = 200,
  });

  final double diameter;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

// Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = ColorStyles.defaultMainColor;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        width: size.width,
        height: size.height,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
