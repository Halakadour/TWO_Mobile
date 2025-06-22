import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class LoadingStatusBox extends StatelessWidget {
  const LoadingStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          JsonPath.loading,
          width: 150,
          height: 150,
          repeat: true,
        ),
        const SizedBox(height: 20),
        Text(
          "Loading...",
          style: AppTextStyle.buttonStyle(color: AppColors.blueColor),
        ),
      ],
    );
  }
}
