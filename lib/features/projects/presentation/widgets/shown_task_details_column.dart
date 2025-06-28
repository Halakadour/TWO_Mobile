// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_image_circle.dart';

class ShownTaskDetailsColumn extends StatelessWidget {
  const ShownTaskDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomImageCircle(imagePath: 'assets/images/png/profile 6.png'),
            PaddingConfig.w8,
            Text(
              'Kim Han Soa',
              style: AppTextStyle.subtitle03(color: AppColors.fontLightColor),
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
        Container(
          height: 25,
          width: 100,
          decoration: BoxDecoration(
              color: AppColors.redColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hight',
                style: AppTextStyle.subtitle04(color: AppColors.redColor),
              ),
              PaddingConfig.w32,
              Icon(
                Iconsax.arrow_down_1,
                color: AppColors.redColor,
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
