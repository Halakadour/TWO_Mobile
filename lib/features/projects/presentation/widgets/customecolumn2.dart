// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/presentation/widgets/customprofile.dart';

class CuustomColoumPage2 extends StatelessWidget {
  const CuustomColoumPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Customprofile(image: 'assets/images/png/profile 1.png'),
            Customprofile(image: 'assets/images/png/profile 2.png'),
            Customprofile(image: 'assets/images/png/profile 3.png'),
            Customprofile(image: 'assets/images/png/profile 4.png'),
            Customprofile(image: 'assets/images/png/profile 5.png'),
            Customprofile(image: 'assets/images/png/profile 2.png'),
            PaddingConfig.w8,
            Icon(
              Iconsax.add_square,
              size: 20,
            )
          ],
        ),
        PaddingConfig.h16,
        Row(
          children: [
            Customprofile(
              image: 'assets/images/png/steve.png',
            ),
            PaddingConfig.w8,
            Text(
              'Hala Kador (you)',
              style: AppTextStyle.subtitle03(color: AppColors.iconColor),
            )
          ],
        ),
        PaddingConfig.h16,
        Row(
          children: [
            Customprofile(
              image: 'assets/images/png/profile 2.png',
            ),
            PaddingConfig.w8,
            Text(
              'Lilian Hourani',
              style: AppTextStyle.subtitle03(color: AppColors.iconColor),
            )
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
        PaddingConfig.h16,
        Row(
          children: [
            Container(
              height: 25,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColors.mainblue.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.document_text_1,
                    color: AppColors.mainblue,
                    size: 15,
                  ),
                  PaddingConfig.w4,
                  Text(
                    'Contract1.pdf',
                    style: AppTextStyle.subtitle04(color: AppColors.mainblue),
                  ),
                ],
              ),
            ),
            PaddingConfig.w8,
            Container(
              height: 25,
              width: 70,
              decoration: BoxDecoration(
                  color: AppColors.mainblue,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  PaddingConfig.w8,
                  Text(
                    'Change',
                    style: AppTextStyle.subtitle04(color: AppColors.cardColor),
                  ),
                  PaddingConfig.w8,
                  Icon(
                    Iconsax.edit_24,
                    color: AppColors.cardColor,
                    size: 12,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
