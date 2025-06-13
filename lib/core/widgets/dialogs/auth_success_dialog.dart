import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';

void showAuthSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          height: 400,
          width: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Image.asset(ImagesPath.shield, height: 180),
              ),
              Text(
                'Operation Done !',
                style: AppTextStyle.heading03(),
              ),
              Text(
                'your account is ready to use',
                style: AppTextStyle.subtitle01(color: AppColors.iconColor),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 250,
                child: GradientOutlineButton(
                  onpressed: () {
                    context.pushReplacementNamed(AppRouteConfig.main);
                  },
                  text: 'Go to Homepage',
                  textColor: AppColors.cardColor,
                  buttonColor: AppColors.buttonColor,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
