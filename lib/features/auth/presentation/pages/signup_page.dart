import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/gradientoutlinebutton.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custombutton.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_row.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customdialog1.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customemail.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customfullname.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custompassword.dart';
import 'package:two_mobile/features/auth/presentation/widgets/divider.dart';
import 'package:two_mobile/features/intro/presentation/pages/onboardpage3.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 350, bottom: 15),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Onboardingpage3()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 170, bottom: 20),
                child: Text(
                  'Create your\nAccount',
                  style: AppTextStyle.heading01(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CustomFullName()),
                    const SizedBox(child: h10),
                    const CustomEmail(),
                    const CustomPassword(),
                    const SizedBox(height: 15),
                    Gradientoutlinebutton(
                      onpressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialog();
                            });
                      },
                      text: 'Sign Up',
                      TextColor: AppColors.cardColor,
                      ButtonColor: AppColors.buttonColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const widgetDivider(),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                        image: 'assets/images/png/google-logo.png',
                        text: 'Continue With Google',
                        onpressed: () {}),
                    const SizedBox(height: 20),
                    CustomButton(
                        image: 'assets/images/png/Social Icons.png',
                        text: 'Continue With GitHub',
                        onpressed: () {}),
                    const SizedBox(
                      height: 30,
                    ),
                    const CoustomRow(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
