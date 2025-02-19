import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_cofirmpassword.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customdialod2.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custompassword.dart';
import 'package:two_mobile/features/auth/presentation/widgets/gradientoutlinebutton.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 28,
                    ),
                  ),
                  Text(
                    'Forgot Password',
                    style: AppTextStyle.heading03(),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/png/Padlock.png',
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 120, bottom: 30),
                child: Text(
                  'create your new password',
                  style: AppTextStyle.subtitle01(),
                ),
              ),
              const CustomPassword(),
              const SizedBox(
                child: h10,
              ),
              const CustomConfirmPassword(),
              const SizedBox(
                height: 100,
              ),
              Gradientoutlinebutton(
                  child: Text(
                    'continue',
                    style: AppTextStyle.heading04(color: AppColors.whiteColor),
                  ),
                  onpressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDailog2();
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
