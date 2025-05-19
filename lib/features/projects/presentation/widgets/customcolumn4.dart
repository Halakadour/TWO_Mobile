// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomcolumnPage4 extends StatelessWidget {
  const CustomcolumnPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'making the ui design and show it \ndoctor sohail and white the report for it...',
              style: AppTextStyle.subtitle04(color: AppColors.fontLightColor),
            ),
          ],
        ),
        PaddingConfig.h16,
        Container(
          height: 25,
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.mainblue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'In-Progress',
                style: AppTextStyle.subtitle04(color: AppColors.mainblue),
              ),
              PaddingConfig.w4,
              Icon(
                Iconsax.arrow_down_1,
                color: AppColors.mainblue,
                size: 16,
              )
            ],
          ),
        ),
        PaddingConfig.h16,
        Row(
          children: [
            Text(
              'Dec 14, 2024',
              style: AppTextStyle.subtitle02(color: AppColors.iconColor),
            ),
            PaddingConfig.w8,
            Icon(
              Iconsax.edit_24,
              color: AppColors.mainblue,
              size: 18,
            )
          ],
        ),
        PaddingConfig.h16,
        Row(
          children: [
            Text(
              'Dec 14, 2024',
              style: AppTextStyle.subtitle02(color: AppColors.iconColor),
            ),
            PaddingConfig.w8,
            Icon(
              Iconsax.edit_24,
              color: AppColors.mainblue,
              size: 18,
            )
          ],
        ),
      ],
    );
  }
}
