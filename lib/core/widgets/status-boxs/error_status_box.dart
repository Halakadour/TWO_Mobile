import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class ErrorStatusBox extends StatelessWidget {
  const ErrorStatusBox({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(
          JsonPath.error,
          width: 150,
          height: 150,
          repeat: true,
        ),
        const SizedBox(height: 20),
        Text(
          errorMessage,
          style: AppTextStyle.buttonStyle(color: AppColors.redColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
