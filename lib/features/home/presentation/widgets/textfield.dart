// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class TextFieldPage extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color? color;
  final Color textcolor;
  final Color Bordercolor;
  final Color textfield;
  final Color iconcolor;
  final Color bordercolor;
  final IconData? prefix;
  final IconData? suffix;
  const TextFieldPage(
      {required this.prefix,
      required this.suffix,
      required this.color,
      required this.Bordercolor,
      required this.textcolor,
      required this.textfield,
      required this.iconcolor,
      required this.bordercolor,
      required this.text,
      super.key,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
          style: AppTextStyle.subtitle02(color: textfield),
          decoration: InputDecoration(
              filled: true,
              fillColor: color,
              hintText: text,
              hintStyle: AppTextStyle.subtitle02(color: textcolor),
              prefixIcon: Icon(prefix, color: iconcolor),
              suffixIcon: Icon(
                suffix,
                color: iconcolor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Bordercolor,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
    );
  }
}
