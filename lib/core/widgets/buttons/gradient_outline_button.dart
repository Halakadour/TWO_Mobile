import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class GradientOutlineButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Gradient buttonColor;
  final VoidCallback onpressed;
  const GradientOutlineButton({
    required this.text,
    required this.onpressed,
    super.key,
    required this.textColor,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 50,
      decoration: BoxDecoration(
          gradient: buttonColor, borderRadius: BorderRadius.circular(25)),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Colors.transparent)),
          onPressed: onpressed,
          child: Text(text, style: AppTextStyle.subtitle01(color: textColor))),
    );
  }
}
