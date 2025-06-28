import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/calendar/custom_border_painter.dart';
import 'package:two_mobile/features/home/presentation/widgets/home/custom_visibility_box.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_text_field_for_home.dart';

class CustomCreateNewProjectDialog extends StatelessWidget {
  const CustomCreateNewProjectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardColor,
      contentPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: const RoundedRectangleBorder(
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
              const CustomTextFieldForHome(
                height: 55,
                width: 340,
                bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: null,
                suffix: null,
                text: 'Project Name',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
              ),
              PaddingConfig.h8,
              const CustomTextFieldForHome(
                height: 120,
                width: 340,
                bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: null,
                suffix: null,
                text: 'Project Description',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
              ),
              PaddingConfig.h8,
              const Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldForHome(
                      height: 65,
                      width: 160,
                      bordercolor: AppColors.fieldfield,
                      textfield: AppColors.blackColor,
                      color: AppColors.fieldfield,
                      prefix: null,
                      suffix: Iconsax.calendar_1,
                      text: 'Start Date',
                      textcolor: AppColors.fontLightColor,
                      iconcolor: AppColors.fontLightColor,
                    ),
                    CustomTextFieldForHome(
                      height: 65,
                      width: 160,
                      bordercolor: AppColors.fieldfield,
                      textfield: AppColors.blackColor,
                      color: AppColors.fieldfield,
                      prefix: null,
                      suffix: Iconsax.calendar_1,
                      text: 'End Date',
                      textcolor: AppColors.fontLightColor,
                      iconcolor: AppColors.fontLightColor,
                    ),
                  ],
                ),
              ),
              PaddingConfig.h8,
              const CustomvisibilityBox(),
              PaddingConfig.h24,
              CustomBorderPainter(
                onTap: () {
                  context.pushNamed(AppRouteConfig.addTeam);
                },
                text: 'Add Team',
              ),
              const SizedBox(height: 20),
              CustomBorderPainter(
                onTap: () {},
                text: 'Add Contract',
              ),
              PaddingConfig.h24,
              GradientOutlineButton(
                buttonColor: AppColors.buttonColor,
                textColor: AppColors.cardColor,
                onpressed: () {
                  context.pushNamed(AppRouteConfig.makeTeam);
                },
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
