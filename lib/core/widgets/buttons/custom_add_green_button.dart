import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomAddGreenButton extends StatelessWidget {
  const CustomAddGreenButton({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 80,
        decoration: BoxDecoration(
          color: AppColors.maingreen,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.cardColor,
          ),
        ),
        child: Center(
          child: Text(
            'Add',
            style: AppTextStyle.subtitle01(
              color: AppColors.cardColor,
            ),
          ),
        ),
      ),
    );
  }
}
