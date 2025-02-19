import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/mywidegt/main_text_field.dart';

class CustomConfirmPassword extends StatefulWidget {
  const CustomConfirmPassword({super.key});

  @override
  State<CustomConfirmPassword> createState() => _CustomConfirmPasswordState();
}

class _CustomConfirmPasswordState extends State<CustomConfirmPassword> {
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
        Icons.lock_sharp,
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
                Icons.remove_red_eye_rounded,
                color: AppColors.fontLightColor,
              )
            : Image.asset(
                'assets/images/png/Hide.png',
                color: AppColors.fontLightColor,
              ));
  }
}
