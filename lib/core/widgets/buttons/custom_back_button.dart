import 'package:flutter/material.dart';
import 'package:two_mobile/features/auth/presentation/pages/signup_page.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignupPage()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 36,
          ),
        ),
      ],
    );
  }
}
