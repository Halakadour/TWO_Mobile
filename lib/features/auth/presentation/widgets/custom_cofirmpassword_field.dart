import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/main_text_field.dart';

class CustomConfirmPasswordField extends StatefulWidget {
  const CustomConfirmPasswordField({super.key});

  @override
  State<CustomConfirmPasswordField> createState() =>
      _CustomConfirmPasswordFieldState();
}

class _CustomConfirmPasswordFieldState
    extends State<CustomConfirmPasswordField> {
  TextEditingController confirmpasswordController = TextEditingController();
  bool _isSecurePassword = false;
  @override
  Widget build(BuildContext context) {
    return MainTextField(
      controller: confirmpasswordController,
      validator: (p0) {
        if (p0!.isEmpty) {
          return "Enter a vaild password";
        } else if (p0.length < 6) {
          return "Your password is too short";
        }
        return null;
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
      hint: "Confirm Password",
      hintColor: AppColors.fontLightColor,
      counterText: '',
      isPassword: _isSecurePassword,
      keyboardType: TextInputType.number,
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
