import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/mywidegt/myElevatedbutton.dart';
import 'package:two_mobile/features/auth/presentation/pages/signup_page.dart';

class Onboardpage2 extends StatelessWidget {
  const Onboardpage2({super.key});

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
                  ImagesPath.onboardpage2,
                  height: 250,
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Always Connnect With &  \n Your Team Anywhere',
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
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Onboardpage2();
                      },
                    ));
                  },
                  colorbutton: AppColors.mainColor,
                  colortext: Colors.white,
                  title: 'Next'),
              const SizedBox(
                height: 25,
              ),
              MyElevatedButton(
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const SignupPage();
                      },
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
