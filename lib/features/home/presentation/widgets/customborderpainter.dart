import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customborderpainter extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Customborderpainter({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      height: 50,
      child: CustomPaint(
        painter: DashedRoundedPainter(
          color: AppColors.greenColor,
          strokeWidth: 2,
          borderRadius: 20,
          dashLength: 4,
          gapLength: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 110),
          child: GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: AppColors.greenColor, width: 2)),
                  child: const Icon(
                    Icons.add,
                    size: 18,
                    color: AppColors.greenColor,
                  ),
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
