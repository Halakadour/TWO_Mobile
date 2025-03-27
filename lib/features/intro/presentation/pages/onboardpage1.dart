import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
//import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/mywidegt/myElevatedbutton.dart';
import 'package:two_mobile/features/auth/presentation/pages/signup_page.dart';
import 'package:two_mobile/features/intro/presentation/pages/onboardpage2.dart';

class OnboardPage1 extends StatefulWidget {
  const OnboardPage1({super.key});

  @override
  State<OnboardPage1> createState() => _OnboardPage1State();
}

class _OnboardPage1State extends State<OnboardPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: pagePadding,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  ImagesPath.onboardpage1,
                  height: 250,
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Organize Your Tasks &  \nProjects Easily',
                style: AppTextStyle.heading01(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'by using this app you can manage \n project with professional team life cycle  \nwhat ever i say ',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 25,
              ),
              MyElevatedButton(
                colorbutton: AppColors.mainColor,
                colortext: Colors.white,
                title: 'Next',
                ontap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Onboardpage2(),
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
              MyElevatedButton(
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ));
                  },
                  colorbutton: AppColors.fieldfield,
                  colortext: AppColors.mainColor,
                  title: 'Skip'),
            ],
          ),
        ),
      ),
    );
  }
}
