import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/auth/presentation/pages/login_page.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'already have an account ?',
          style: AppTextStyle.subtitle01(color: AppColors.fontLightColor),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: Text(
            'Sign In',
            style: AppTextStyle.subtitle01(color: AppColors.greenColor),
          ),
        )
      ],
    );
  }
}
