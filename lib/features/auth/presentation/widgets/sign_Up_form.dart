import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/constants/sizes_config.dart';
import 'package:two_mobile/config/paths/text_strings.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/error/validation.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/core/widgets/main_text_field.dart';
import 'package:two_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_google_githup_buttons.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  bool _isSecurePassword = false;
  ValueNotifier<bool> isHover = ValueNotifier(false);
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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
            MainTextField(
              controller: _nameController,
              validator: (name) {
                if (!(name != null && name.isNotShortText())) {
                  return 'Enter your Name';
                }
                return null;
              },
              fillColor: AppColors.fieldfield,
              prefixIcon: const Icon(
                Icons.person,
                color: AppColors.fontLightColor,
              ),
              hint: "Full Name",
              hintColor: AppColors.fontLightColor,
            ),
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
                  Icons.email_rounded,
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
                Icons.lock_sharp,
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
            PaddingConfig.h16,
            // confirmPassword
            MainTextField(
              controller: _confirmPasswordController,
              validator: (password) {
                if (password != null && password.length >= 8) {
                  return null;
                } else {
                  return TextStrings.confirmPasswordValidation;
                }
              },
              fillColor: AppColors.fieldfield,
              prefixIcon: const Icon(
                Icons.lock_sharp,
                color: AppColors.fontLightColor,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(11),
                child: togglepassword(),
              ),
              hint: "confirmPassword",
              hintColor: AppColors.fontLightColor,
              counterText: '',
              isPassword: _isSecurePassword,
              keyboardType: TextInputType.number,
            ),
            PaddingConfig.h16,
            const SizedBox(height: SizesConfig.spaceBtwItems),
            GradientOutlineButton(
              onpressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        SignUpEvent(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            passwordConfirmation:
                                _confirmPasswordController.text),
                      );
                }
              },
              text: 'Sign Up',
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
                Icons.remove_red_eye_rounded,
                color: AppColors.fontLightColor,
              )
            : Image.asset(
                'assets/images/png/Hide.png',
                color: AppColors.fontLightColor,
              ));
  }
}
