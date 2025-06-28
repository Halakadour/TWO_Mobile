import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class SeeAllTextButton extends StatelessWidget {
  final VoidCallback onpressed;
  const SeeAllTextButton({required this.onpressed, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpressed,
        child: Text(
          'See All',
          style: AppTextStyle.subtitle01(color: AppColors.mainColor),
        ));
  }
}
