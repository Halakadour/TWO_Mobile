import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class Gradientoutlinebutton extends StatelessWidget {
  final String text;
  final Color TextColor;
  final Gradient ButtonColor;
  final VoidCallback onpressed;
  const Gradientoutlinebutton({
    required this.text,
    required this.onpressed,
    super.key,
    required this.TextColor,
    required this.ButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: BoxDecoration(
          gradient: ButtonColor, borderRadius: BorderRadius.circular(25)),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Colors.transparent)),
          onPressed: onpressed,
          child: Text(text, style: AppTextStyle.subtitle01(color: TextColor))),
    );
  }
}
