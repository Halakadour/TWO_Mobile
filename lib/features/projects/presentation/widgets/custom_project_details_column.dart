import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_icon_with_text.dart';

class CustomProjectDetailsColumn extends StatelessWidget {
  const CustomProjectDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.profile_2user,
          text: 'Team',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.user,
          text: 'Manager',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.user,
          text: 'Client',
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
          text: 'Duration',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.eye_slash,
          text: 'Visibilty',
        ),
        PaddingConfig.h16,
        CustomIconWithText(
          color: AppColors.blackColor,
          icon: Iconsax.document_text_1,
          text: 'Contract',
        ),
      ],
    );
  }
}
