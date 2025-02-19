import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';

class Gradientoutlinebutton extends StatelessWidget {
  final Widget child;
  final VoidCallback onpressed;
  const Gradientoutlinebutton(
      {required this.child, required this.onpressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      decoration: BoxDecoration(
          gradient: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(25)),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Colors.transparent)),
          onPressed: onpressed,
          child: child),
    );
  }
}
