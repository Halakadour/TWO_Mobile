import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomGoogleGithupButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onpressed;
  const CustomGoogleGithupButton(
      {required this.image,
      required this.text,
      required this.onpressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(2222, 50),
          backgroundColor: AppColors.cardColor,
          side: const BorderSide(color: AppColors.fieldfield, width: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              cacheHeight: 22,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: AppTextStyle.subtitle01(),
            )
          ],
        ));
  }
}
