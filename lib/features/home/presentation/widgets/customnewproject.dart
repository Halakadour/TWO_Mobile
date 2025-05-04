// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/gradientoutlinebutton.dart';
import 'package:two_mobile/features/home/presentation/pages/add_project_manager_page.dart';
import 'package:two_mobile/features/home/presentation/pages/add_team_member_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customborderpainter.dart';
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
              height: 60,
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
            Padding(
              padding: const EdgeInsets.only(top: 18, right: 18, left: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldPage(
                    height: 80,
                    width: 170,
                    Bordercolor: AppColors.fieldfield,
                    textfield: AppColors.blackColor,
                    color: AppColors.fieldfield,
                    prefix: null,
                    suffix: Icons.date_range_rounded,
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
                    prefix: null,
                    suffix: Icons.date_range_rounded,
                    text: 'End Date',
                    textcolor: AppColors.fontLightColor,
                    iconcolor: AppColors.fontLightColor,
                    bordercolor: AppColors.fieldfield,
                  ),
                ],
              ),
            ),
            Customborderpainter(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddProjectManagerPage()));
              },
              text: 'Add Manager',
            ),
            SizedBox(height: 20),
            Customborderpainter(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTeamMemberPage()));
              },
              text: 'Add Team',
            ),
            SizedBox(height: 20),
            Customborderpainter(
              onTap: () {},
              text: 'Add Contract',
            ),
            SizedBox(height: 30),
            Gradientoutlinebutton(
              ButtonColor: AppColors.buttonColor,
              TextColor: AppColors.cardColor,
              onpressed: () {},
              text: 'create project',
            )
          ],
        ),
      ),
    );
  }
}
