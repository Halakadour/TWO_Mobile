import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/auth/presentation/pages/forget_password.dart';
import 'package:two_mobile/features/auth/presentation/pages/signup_page.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custombutton.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customdialod2.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customemail.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custompassword.dart';
import 'package:two_mobile/features/auth/presentation/widgets/divider.dart';
import 'package:two_mobile/features/auth/presentation/widgets/gradientoutlinebutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 350, bottom: 20),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 130, bottom: 70),
                child: Text(
                  'Login To Your\nAccount',
                  style: AppTextStyle.heading01(
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: Column(
                  children: [
                    const CustomEmail(),
                    const SizedBox(
                      child: h10,
                    ),
                    const CustomPassword(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPassword()));
                        },
                        child: Text(
                          'Forgot the password ?',
                          style: AppTextStyle.subtitle01(
                              color: AppColors.greenColor),
                        )),
                    const SizedBox(height: 10),
                    Gradientoutlinebutton(
                      child: Text(
                        'Sign In',
                        style:
                            AppTextStyle.heading04(color: AppColors.whiteColor),
                      ),
                      onpressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDailog2();
                            });
                      },
                    ),
                    const SizedBox(
                      child: h20,
                    ),
                    const widgetDivider(),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                        image: 'assets/images/png/google-logo.png',
                        text: 'Continue With Google',
                        onpressed: () {}),
                    const SizedBox(child: h20),
                    CustomButton(
                        image: 'assets/images/png/Social Icons.png',
                        text: 'Continue With GitHub',
                        onpressed: () {}),
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
