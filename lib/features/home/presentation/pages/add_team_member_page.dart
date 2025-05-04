// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/gradientoutlinebutton.dart';
import 'package:two_mobile/features/home/presentation/pages/add_project_manager_page.dart';
import 'package:two_mobile/features/home/presentation/pages/make_team_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customadd.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class AddTeamMemberPage extends StatelessWidget {
  const AddTeamMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Customiconback(
                  Onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AddProjectManagerPage()));
                  },
                  text: 'Add Team'),
              SizedBox(height: 25),
              TextFieldPage(
                height: 60,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Icons.search,
                suffix: null,
                text: 'Search',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/Frontend.png',
                NameText: 'Frontend Team',
                TitleText: '',
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/Mobile.png',
                NameText: 'Mobile Team   ',
                TitleText: '',
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/backend.png',
                NameText: 'Backend Team',
                TitleText: '',
              ),
              SizedBox(height: 220),
              Gradientoutlinebutton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTeamMemberPage()));
                },
                text: 'Next',
                TextColor: AppColors.cardColor,
                ButtonColor: AppColors.buttonColor,
              ),
              SizedBox(height: 12),
              Gradientoutlinebutton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MakeTeamPage()));
                },
                text: 'Or Make A New Team',
                TextColor: AppColors.greenColor,
                ButtonColor: AppColors.buttonColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
