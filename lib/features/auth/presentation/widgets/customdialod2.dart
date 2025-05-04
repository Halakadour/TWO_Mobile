import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/gradientoutlinebutton.dart';
import 'package:two_mobile/core/mywidegt/bottom_navigationbar_page.dart';

class CustomDailog2 extends StatelessWidget {
  const CustomDailog2({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 400,
        width: 350,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset('assets/images/png/Shield.png', height: 180),
            ),
            Text(
              'Operation Done !',
              style: AppTextStyle.heading03(),
            ),
            Text(
              'your account is ready to use',
              style: AppTextStyle.subtitle01(color: AppColors.iconColor),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              child: Gradientoutlinebutton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigationbarPage()));
                },
                text: 'Go to Homepage',
                TextColor: AppColors.cardColor,
                ButtonColor: AppColors.buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
