// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/widgets/customnewproject.dart';

class CustomBubblePainter extends StatelessWidget {
  const CustomBubblePainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 103,
          top: 570,
          child: CustomPaint(
            painter: BubblePainter(),
            child: Container(
              padding: const EdgeInsets.only(left: 35, top: 2),
              width: 180,
              height: 100,
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomNewProject();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Project',
                            style: TextStyle(
                                fontSize: 18,
                                color: AppColors.blackColor.withOpacity(0.8)),
                          ),
                          const SizedBox(width: 15),
                          Icon(
                            Icons.assignment_rounded,
                            color: AppColors.blackColor.withOpacity(0.8),
                            size: 22,
                          )
                        ],
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Group',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.blackColor.withOpacity(0.8)),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.group_outlined,
                            color: AppColors.blackColor.withOpacity(0.8),
                            size: 22,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();

    // رسم الفقاعة
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(15),
    ));

    // رسم الذيل
    path.moveTo(size.width / 2 - 40 / 2, size.height);
    path.lineTo(size.width / 2, size.height + 20);
    path.lineTo(size.width / 2 + 40 / 2, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.3), 5.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
