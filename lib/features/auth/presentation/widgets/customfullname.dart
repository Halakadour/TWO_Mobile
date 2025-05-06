import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/main_text_field.dart';

class CustomFullName extends StatelessWidget {
  const CustomFullName({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController();
    return MainTextField(
      controller: fullnameController,
      validator: (name) {
        if (!(name != null && name.length >= 3)) {
          return 'Enter your Name';
        }
        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
          return 'please enter letters only';
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
    );
  }
}
