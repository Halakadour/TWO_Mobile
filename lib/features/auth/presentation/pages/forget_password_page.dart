import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/dialogs/auth_success_dialog.dart';
import 'package:two_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_cofirmpassword_field.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_password_field.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});
  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
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
                      Iconsax.arrow_left,
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
              const CustomPasswordField(),
              PaddingConfig.h8,
              const CustomConfirmPasswordField(),
              const SizedBox(
                height: 100,
              ),
              GradientOutlineButton(
                onpressed: () {
                  showAuthSuccessDialog(context);
                },
                text: 'continue',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
