import 'package:flutter/material.dart';

class DashedVerticalLine extends StatelessWidget {
  final double height;
  final double dashHeight;
  final double dashWidth;
  final double dashSpacing;
  final Color color;

  const DashedVerticalLine({
    super.key,
    required this.height,
    this.dashHeight = 4.0,
    this.dashWidth = 1.0,
    this.dashSpacing = 2.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(dashWidth, height),
      painter: _DashedLinePainter(
        dashHeight: dashHeight,
        dashWidth: dashWidth,
        dashSpacing: dashSpacing,
        color: color,
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashHeight;
  final double dashWidth;
  final double dashSpacing;
  final Color color;

  _DashedLinePainter({
    required this.dashHeight,
    required this.dashWidth,
    required this.dashSpacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = dashWidth
      ..style = PaintingStyle.fill;

    double startY = 0.0;

    while (startY < size.height) {
      canvas.drawRect(
        Rect.fromLTWH(0, startY, dashWidth, dashHeight),
        paint,
      );
      startY += dashHeight + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
