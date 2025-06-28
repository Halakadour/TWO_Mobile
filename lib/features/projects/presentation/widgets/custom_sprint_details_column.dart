import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_icon_with_text.dart';

class CustomSprintDetailsColumn extends StatelessWidget {
  const CustomSprintDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.flag_2,
          text: 'Goal',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.tick_square,
          text: 'Status',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.calendar_1,
          text: 'Start-Line',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.calendar_1,
          text: 'Dead-Line',
        ),
      ],
    );
  }
}
