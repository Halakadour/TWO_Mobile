import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomBorderPainter extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomBorderPainter({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      height: 50,
      child: CustomPaint(
        painter: DashedRoundedPainter(
          color: AppColors.greenColor,
          strokeWidth: 2,
          borderRadius: 20,
          dashLength: 4,
          gapLength: 5,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Iconsax.add_square,
                  size: 23,
                  color: AppColors.greenColor,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: AppTextStyle.subtitle01(color: AppColors.greenColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashedRoundedPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double borderRadius;
  final double dashLength;
  final double gapLength;

  DashedRoundedPainter({
    required this.color,
    required this.strokeWidth,
    required this.borderRadius,
    required this.dashLength,
    required this.gapLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );

    final path = Path()..addRRect(rect);
    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final start = distance;
        final end = distance + dashLength;
        if (end > metric.length) break;

        final dashPath = metric.extractPath(start, end);
        canvas.drawPath(dashPath, paint);
        distance = end + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
