// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/customborderpainter.dart';
import 'package:two_mobile/features/home/presentation/widgets/customvisibility.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class CustomNewProject extends StatelessWidget {
  const CustomNewProject({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardColor,
      contentPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(35), bottom: Radius.zero)),
      insetPadding: EdgeInsets.zero,
      content: Container(
        height: 550,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Divider(
                  color: AppColors.fontLightColor.withOpacity(0.5),
                  height: 35,
                  thickness: 3,
                  endIndent: 168,
                  indent: 165,
                ),
              ),
              Text(
                'New Project',
                style: AppTextStyle.heading04(),
              ),
              Divider(
                color: AppColors.fontLightColor.withOpacity(0.5),
                height: 35,
              ),
              TextFieldPage(
                height: 55,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: null,
                suffix: null,
                text: 'Project Name',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 120,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: null,
                suffix: null,
                text: 'Project Description',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h8,
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldPage(
                      height: 65,
                      width: 160,
                      Bordercolor: AppColors.fieldfield,
                      textfield: AppColors.blackColor,
                      color: AppColors.fieldfield,
                      prefix: null,
                      suffix: Iconsax.calendar_1,
                      text: 'Start Date',
                      textcolor: AppColors.fontLightColor,
                      iconcolor: AppColors.fontLightColor,
                      bordercolor: AppColors.fieldfield,
                    ),
                    TextFieldPage(
                      height: 65,
                      width: 160,
                      Bordercolor: AppColors.fieldfield,
                      textfield: AppColors.blackColor,
                      color: AppColors.fieldfield,
                      prefix: null,
                      suffix: Iconsax.calendar_1,
                      text: 'End Date',
                      textcolor: AppColors.fontLightColor,
                      iconcolor: AppColors.fontLightColor,
                      bordercolor: AppColors.fieldfield,
                    ),
                  ],
                ),
              ),
              PaddingConfig.h8,
              Customvisibility(),
              PaddingConfig.h24,
              Customborderpainter(
                onTap: () {
                  context.pushReplacementNamed(AppRouteConfig.addteammember);
                },
                text: 'Add Team',
              ),
              SizedBox(height: 20),
              Customborderpainter(
                onTap: () {
                  context.pushReplacementNamed(AppRouteConfig.maketeam);
                },
                text: 'Add Contract',
              ),
              PaddingConfig.h24,
              GradientOutlineButton(
                buttonColor: AppColors.buttonColor,
                textColor: AppColors.cardColor,
                onpressed: () {},
                text: 'create project',
              ),
              PaddingConfig.h16,
            ],
          ),
        ),
      ),
    );
  }
}
