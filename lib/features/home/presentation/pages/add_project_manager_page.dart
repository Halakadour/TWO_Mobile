// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/bottom_navigation_bar_page.dart';
import 'package:two_mobile/features/home/presentation/pages/add_team_member_page.dart';
import 'package:two_mobile/features/home/presentation/pages/make_team_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customadd.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class AddProjectManagerPage extends StatelessWidget {
  const AddProjectManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
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
                            builder: (context) => const MainPage()));
                  },
                  text: 'Add Project Manger '),
              SizedBox(height: 25),
              TextFieldPage(
                height: 55,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.search_normal_1,
                suffix: null,
                text: 'Search',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/image 1.png',
                nameText: 'Hala Kadour',
                titleText: 'Project-Manager',
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/image 2.png',
                nameText: 'Lilian Hourani',
                titleText: 'Project-Manager',
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/image 3.png',
                nameText: 'Laila Mohamd',
                titleText: 'Project-Manager',
              ),
              SizedBox(height: 30),
              CustomAdd(
                image: 'assets/images/png/image 1.png',
                nameText: 'Roha Jaghal',
                titleText: 'Project-Manager',
              ),
              SizedBox(height: 130),
              GradientOutlineButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTeamMemberPage()));
                },
                text: 'Next',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              ),
              SizedBox(height: 12),
              GradientOutlineButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MakeTeamPage()));
                },
                text: 'Or Make A New Team',
                textColor: AppColors.greenColor,
                buttonColor: AppColors.buttonColor2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
