import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/mywidegt/main_text_field.dart';

class CustomEmail extends StatelessWidget {
  const CustomEmail({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return MainTextField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        validator: (email) {
          if (email != null &&
              RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                caseSensitive: false,
              ).hasMatch(email)) {
            return null;
          } else {
            return "Add  valid email ";
          }
        },
        fillColor: AppColors.fieldfield,
        hint: "Email",
        hintColor: AppColors.fontLightColor,
        prefixIcon: const Icon(
          Icons.email_rounded,
          color: AppColors.fontLightColor,
        ));
  }
}
