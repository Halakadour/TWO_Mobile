import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';

class CustomMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomMeetingButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 320,
      right: 15,
      width: 56,
      height: 56,
      child: FloatingActionButton(
        backgroundColor: AppColors.navColor,
        onPressed: onPressed,
        child: const Icon(
          Iconsax.add,
          color: AppColors.cardColor,
          size: 35,
        ),
      ),
    );
  }
}
