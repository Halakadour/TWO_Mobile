// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/paths/text_strings.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/auth/presentation/pages/signup_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class ProgrammerFillProfilePage extends StatelessWidget {
  const ProgrammerFillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Customiconback(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                  text: TextStrings.fillProfile),
              PaddingConfig.h64,
              Stack(
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(ImagesPath.profile))),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.maingreen,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: AppColors.cardColor,
                        ),
                      )),
                ],
              ),
              PaddingConfig.h64,
              TextFieldPage(
                height: 60,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Icons.business_center_rounded,
                suffix: Icons.keyboard_arrow_down_rounded,
                text: 'Role',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.iconColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h16,
              TextFieldPage(
                height: 60,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Icons.article_rounded,
                suffix: null,
                text: 'CV',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.iconColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h180,
              GradientOutlineButton(
                onpressed: () {
                  context.pushReplacementNamed(AppRouteConfig.main);
                },
                text: 'continue',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
