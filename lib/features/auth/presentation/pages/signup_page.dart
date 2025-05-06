import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/dialogs/user_type_dialog.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custombutton.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_row.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customemail.dart';
import 'package:two_mobile/features/auth/presentation/widgets/customfullname.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custompassword.dart';
import 'package:two_mobile/features/auth/presentation/widgets/divider.dart';

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
        padding: PaddingConfig.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Create your\nAccount',
                    style: AppTextStyle.heading01(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              PaddingConfig.h24,
              Column(
                children: [
                  const CustomFullName(),
                  const CustomEmail(),
                  const CustomPassword(),
                  PaddingConfig.h16,
                  GradientOutlineButton(
                    onpressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const UserTypeDialog();
                          });
                    },
                    text: 'Sign Up',
                    textColor: AppColors.cardColor,
                    buttonColor: AppColors.buttonColor,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
