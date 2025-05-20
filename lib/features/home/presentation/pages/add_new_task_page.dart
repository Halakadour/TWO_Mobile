// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/customborderpainter.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';
import 'package:two_mobile/features/projects/presentation/pages/project_detailes_page.dart';
import 'package:two_mobile/features/projects/presentation/pages/sprint_detailes_page.dart';

class AddNewTaskPage extends StatelessWidget {
  const AddNewTaskPage({super.key});

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
                  text: 'Add New Task'),
              PaddingConfig.h8,
              Text(
                'Title',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.document_text,
                suffix: null,
                text: 'Task Title',
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
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.element_3,
                suffix: null,
                text: 'Task Description',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h16,
              Text(
                'Status',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.tick_square,
                suffix: null,
                text: 'Task Status',
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
                    height: 80,
                    width: 170,
                    Bordercolor: AppColors.fieldfield,
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
                    height: 80,
                    width: 170,
                    Bordercolor: AppColors.fieldfield,
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
                'Priority',
                style: AppTextStyle.subtitle01(),
              ),
              PaddingConfig.h8,
              TextFieldPage(
                height: 60,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.flag,
                suffix: Iconsax.arrow_down_14,
                text: 'Task Priority',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              PaddingConfig.h8,
              Text(
                'Assign user',
                style: AppTextStyle.heading04(),
              ),
              PaddingConfig.h24,
              Center(
                child: Customborderpainter(
                  onTap: () {},
                  text: 'Add Team',
                ),
              ),
              PaddingConfig.h16,
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
