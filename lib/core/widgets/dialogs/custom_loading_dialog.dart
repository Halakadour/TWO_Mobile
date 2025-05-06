import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

void showCustomLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
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
          ),
        ),
      );
    },
  );
}
