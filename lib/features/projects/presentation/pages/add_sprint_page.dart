// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';
import 'package:two_mobile/features/projects/presentation/pages/project_detailes_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/sprint_detailes_page.dart';

class AddSprintPage extends StatelessWidget {
  const AddSprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConfig.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customiconback(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProjectDetailesPage()));
                  },
                  text: 'Add New Sprint '),
              PaddingConfig.h24,
              Text(
                'Label',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                bordercolor2: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.document_text,
                suffix: null,
                text: 'Sprint Label',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h16,
              Text(
                'Description',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                bordercolor2: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.element_3,
                suffix: null,
                text: 'Sprint Description',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h16,
              Text(
                'Goal',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                bordercolor2: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.tick_square,
                suffix: null,
                text: 'Sprint Goal',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h16,
              Text(
                'Due Date',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldPage(
                    height: 65,
                    width: 160,
                    bordercolor2: AppColors.fieldfield,
                    textfield: AppColors.blackColor,
                    color: AppColors.fieldfield,
                    prefix: Iconsax.calendar_1,
                    suffix: null,
                    text: 'Start Date',
                    textcolor: AppColors.fontLightColor,
                    iconcolor: AppColors.fontLightColor,
                    bordercolor: AppColors.fieldfield,
                  ),
                  TextFieldPage(
                    height: 65,
                    width: 160,
                    bordercolor2: AppColors.fieldfield,
                    textfield: AppColors.blackColor,
                    color: AppColors.fieldfield,
                    prefix: Iconsax.calendar_1,
                    suffix: null,
                    text: 'End Date',
                    textcolor: AppColors.fontLightColor,
                    iconcolor: AppColors.fontLightColor,
                    bordercolor: AppColors.fieldfield,
                  ),
                ],
              ),
              Text(
                'Status',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                bordercolor2: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.tick_square,
                suffix: null,
                text: 'Sprint Status',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h64,
              Center(
                child: GradientOutlineButton(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SprintDetailesPage()));
                  },
                  text: 'Create Sprint',
                  textColor: AppColors.cardColor,
                  buttonColor: AppColors.buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
