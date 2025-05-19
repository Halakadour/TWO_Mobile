// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomGestureDetectorPage extends StatelessWidget {
  final String text;
  final Color containercolor;
  final Color color;
  final IconData icon;
  const CustomGestureDetectorPage(
      {super.key,
      required this.text,
      required this.containercolor,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 55,
        width: 160,
        decoration: BoxDecoration(
            color: containercolor,
            border: Border(
              left: BorderSide(color: color),
              right: BorderSide(color: color),
              bottom: BorderSide(color: color),
              top: BorderSide.none,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: color.withOpacity(0.8),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: Offset(0, 6)),
              BoxShadow(
                  color: AppColors.cardColor.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, -3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            PaddingConfig.w8,
            Text(
              text,
              style: AppTextStyle.subtitle02(color: color),
            )
          ],
        ),
      ),
    );
  }
}
