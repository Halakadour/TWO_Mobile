import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

// ignore: camel_case_types
class widgetDivider extends StatelessWidget {
  const widgetDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: AppColors.fontLightColor,
        )),
        Text(
          'or',
          style: AppTextStyle.subtitle01(color: AppColors.fontLightColor),
        ),
        const Expanded(child: Divider(color: AppColors.fontLightColor)),
      ],
    );
  }
}
