// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Customtab extends StatelessWidget {
  const Customtab({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0.3,
      tabs: [
        SizedBox(
          height: 40,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.kanban,
                color: AppColors.blackColor.withOpacity(0.9),
              ),
              const SizedBox(width: 8),
              Text(
                'Kanban',
                style: AppTextStyle.heading04(
                    color: AppColors.blackColor.withOpacity(0.9)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          width: 100,
          child: Row(
            children: [
              Icon(
                Iconsax.firstline,
                size: 25,
                color: AppColors.blackColor.withOpacity(0.9),
              ),
              const SizedBox(width: 8),
              Text(
                'List',
                style: AppTextStyle.heading04(
                    color: AppColors.blackColor.withOpacity(0.9)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
