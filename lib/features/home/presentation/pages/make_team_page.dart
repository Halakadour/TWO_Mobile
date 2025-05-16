// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/pages/add_team_member_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customadd.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class MakeTeamPage extends StatelessWidget {
  const MakeTeamPage({super.key});

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
                            builder: (context) => const AddTeamMemberPage()));
                  },
                  text: 'Make A Team'),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Text(
                  'Team Name',
                  style: AppTextStyle.subtitle01(),
                ),
              ),
              SizedBox(height: 10),
              TextFieldPage(
                height: 70,
                width: 340,
                Bordercolor: AppColors.fieldfield,
                textfield: AppColors.blackColor,
                color: AppColors.fieldfield,
                prefix: Iconsax.document_text,
                suffix: null,
                text: 'Team Name',
                textcolor: AppColors.fontLightColor,
                iconcolor: AppColors.fontLightColor,
                bordercolor: AppColors.fieldfield,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 225),
                child: Text('Team Members', style: AppTextStyle.subtitle01()),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 70),
              GradientOutlineButton(
                onpressed: () {},
                text: 'Create A Team',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              ),
              SizedBox(height: 12),
              GradientOutlineButton(
                onpressed: () {},
                text: 'Cancel',
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
