// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/projects/presentation/widgets/customicon&text.dart';

class CustomcolumnPage1 extends StatelessWidget {
  const CustomcolumnPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.profile_2user,
          text: 'Team',
        ),
        PaddingConfig.h16,
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.user,
          text: 'Manager',
        ),
        PaddingConfig.h16,
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.user,
          text: 'Client',
        ),
        PaddingConfig.h16,
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.tick_square,
          text: 'Status',
        ),
        PaddingConfig.h16,
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.calendar_1,
          text: 'Start-Line',
        ),
        PaddingConfig.h16,
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.calendar_1,
          text: 'Dead-Line',
        ),
        PaddingConfig.h16,
        Customicon(
          color: AppColors.blackColor,
          icon: Iconsax.document_text_1,
          text: 'Contract',
        ),
      ],
    );
  }
}
