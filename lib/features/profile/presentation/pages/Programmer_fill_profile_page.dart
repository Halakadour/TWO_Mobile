import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/widgets/textfield.dart';

class ProgrammerFillProfilePage extends StatelessWidget {
  const ProgrammerFillProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          size: 35,
        ),
        title: const Text(
          "Fill Your Profile",
          style: TextStyle(fontFamily: "Outfit"),
        ),
      ),
      body: Column(
        children: [
          Stack(children: [
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage(
                'assets/images/png/logo.png',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(25, 25),
                  backgroundColor: AppColors.greenColor),
              child: const Icon(
                Icons.edit,
                size: 20,
              ),
            )
          ]),
          const TextFieldPage(
            height: 60,
            width: 340,
            Bordercolor: AppColors.fieldfield,
            textfield: AppColors.blackColor,
            color: AppColors.fieldfield,
            prefix: Icons.badge_rounded,
            suffix: Icons.arrow_drop_down,
            text: 'Role',
            textcolor: AppColors.fontLightColor,
            iconcolor: AppColors.fontLightColor,
            bordercolor: AppColors.fieldfield,
          ),
          const TextFieldPage(
            height: 60,
            width: 340,
            Bordercolor: AppColors.fieldfield,
            textfield: AppColors.blackColor,
            color: AppColors.fieldfield,
            prefix: Icons.badge_rounded,
            suffix: null,
            text: 'cv',
            textcolor: AppColors.fontLightColor,
            iconcolor: AppColors.fontLightColor,
            bordercolor: AppColors.fieldfield,
          ),
        ],
      ),
    );
  }
}
