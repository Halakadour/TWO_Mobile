// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customiconback extends StatelessWidget {
  final VoidCallback onpressed;
  final String text;
  const Customiconback({
    required this.onpressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onpressed,
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 32,
            color: AppColors.blackColor,
          ),
        ),
        Text(
          text,
          style: AppTextStyle.heading03(),
        )
      ],
    );
  }
}
