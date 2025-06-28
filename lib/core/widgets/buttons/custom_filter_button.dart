import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({required this.onTap, super.key});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.maingray,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Iconsax.filter_edit,
              color: AppColors.iconColor,
              size: 20,
            ),
            const SizedBox(width: 3),
            Text(
              "Filter",
              style: AppTextStyle.subtitle03(color: AppColors.iconColor),
            )
          ],
        ),
      ),
    );
  }
}
