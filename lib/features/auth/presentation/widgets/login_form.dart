import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/constants/sizes_config.dart';
import 'package:two_mobile/config/paths/text_strings.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/error/validation.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/main_text_field.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/pages/forget_password_page.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_google_githup_buttons.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _isSecurePassword = false;
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SizesConfig.spaceBtwSections,
        ),
        child: Column(
          children: [
            // Email
            MainTextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (email) {
                  if (email != null && email.isValidEmail()) {
                    return null;
                  } else {
                    return TextStrings.emailValidation;
                  }
                },
                fillColor: AppColors.fieldfield,
                hint: "Email",
                hintColor: AppColors.fontLightColor,
                prefixIcon: const Icon(
                  Iconsax.sms,
                  color: AppColors.fontLightColor,
                )),
            PaddingConfig.h8,
            // Password
            MainTextField(
              controller: _passwordController,
              validator: (password) {
                if (password != null) {
                  return null;
                } else {
                  return TextStrings.passwordValidation;
                }
              },
              fillColor: AppColors.fieldfield,
              prefixIcon: const Icon(
                Iconsax.lock,
                color: AppColors.fontLightColor,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(11),
                child: togglepassword(),
              ),
              hint: "Password",
              hintColor: AppColors.fontLightColor,
              counterText: '',
              isPassword: _isSecurePassword,
              keyboardType: TextInputType.number,
            ),
            //Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPasswordPage()));
                  },
                  child: Text(
                    TextStrings.forgetPassword,
                    style: AppTextStyle.subtitle01(color: AppColors.greenColor),
                  ),
                ),
              ],
            ),
            PaddingConfig.h8,
            const SizedBox(height: SizesConfig.spaceBtwItems),
            GradientOutlineButton(
              onpressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        LoginEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                }
              },
              text: 'Sign In',
              textColor: AppColors.whiteColor,
              buttonColor: AppColors.buttonColor,
            ),
            const SizedBox(height: SizesConfig.spaceBtwItems),
            // Google Githup Sign
            const CustomGoogleGitHupButtons(),
          ],
        ),
      ),
    );
  }

  Widget togglepassword() {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        child: _isSecurePassword
            ? const Icon(
                Iconsax.eye,
                color: AppColors.fontLightColor,
              )
            : const Icon(
                Iconsax.eye_slash,
                color: AppColors.fontLightColor,
              ));
  }
}
