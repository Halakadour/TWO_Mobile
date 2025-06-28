import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomIconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const CustomIconWithText(
      {super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        PaddingConfig.w16,
        Text(
          text,
          style: AppTextStyle.subtitle02(color: color),
        )
      ],
    );
  }
}
