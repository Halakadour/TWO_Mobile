import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';

class TriangleWithLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.redColor
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(22, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    canvas.drawPath(path, paint);

    final linePaint = Paint()
      ..color = AppColors.redColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(20, size.height / 2),
        Offset(size.width, size.height / 2), linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
